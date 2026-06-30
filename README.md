<div align="center">

# Ahara — Personalised Indian Meal Planner

**A production-grade Flutter mobile application that delivers personalised daily Indian meal plans powered by a deterministic scoring engine, tailored to each user's dietary profile, nutrition goals, and cooking preferences.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10+-0175C2?logo=dart)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Auth%20%7C%20FCM%20%7C%20Analytics%20%7C%20Crashlytics-FFCA28?logo=firebase)](https://firebase.google.com)
[![Riverpod](https://img.shields.io/badge/Riverpod-3.x-blueviolet)](https://riverpod.dev)
[![Backend](https://img.shields.io/badge/Backend-Django%20%7C%20DRF-092E20?logo=django)](https://github.com/Keshav242002/nutri-app-backend)

</div>

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Feature Walkthrough](#2-feature-walkthrough)
3. [Meal Plan Engine & Calorie Formula](#3-meal-plan-engine--calorie-formula)
4. [Architecture](#4-architecture)
5. [Folder Structure](#5-folder-structure)
6. [State Management — Riverpod](#6-state-management--riverpod)
7. [Navigation — GoRouter](#7-navigation--gorouter)
8. [Network Layer](#8-network-layer)
9. [Offline-First & Caching](#9-offline-first--caching)
10. [Authentication](#10-authentication)
11. [Firebase Integration](#11-firebase-integration)
12. [Design System](#12-design-system)
13. [Data Modelling — Freezed & JSON](#13-data-modelling--freezed--json)
14. [Error Handling Strategy](#14-error-handling-strategy)
15. [Key Engineering Principles](#15-key-engineering-principles)
16. [Tech Stack Summary](#16-tech-stack-summary)
17. [Getting Started](#17-getting-started)

---

## 1. Project Overview

**Ahara** (Sanskrit: *आहार* — nourishment) is a cross-platform mobile app (Android + iOS) that solves a real problem: Indian dietary culture is rich, varied, and deeply personal, yet no mainstream nutrition app adequately serves it.

Ahara bridges that gap by:

- Collecting a **dietary profile** during onboarding (diet pattern, cuisine region, goal, activity level, allergies, cooking skill, spice tolerance, and more).
- Sending that profile to the **Django backend**, which **pushes a fresh daily meal plan** each day via a deterministic scoring engine — the week is built incrementally, not delivered in one batch.
- Presenting each day's meals as interactive **meal cards** — the user can log meals as eaten, swap a recipe, or add a custom meal.
- Tracking **macro and calorie progress** both on a **weekly summary** and a **monthly report**, giving a longitudinal view of diet quality over time.
- Providing an **AI chat assistant** for nutrition questions, with the ability to navigate directly to a recommended recipe.
- Sending **push notifications** for meal reminders and plan updates.
- Working **offline** by showing the last-known plan from a local Hive cache.

### Related Repositories

| Repo | Description |
|---|---|
| **This repo** | Flutter mobile client (Android + iOS) |
| [**nutri-app-backend**](https://github.com/Keshav242002/nutri-app-backend) | Django + DRF backend — meal plan engine, Gemini chat, user profiles, nutrition math |

---

## 2. Feature Walkthrough

### Splash & Onboarding Slides
An animated splash screen handles the initial auth-gate check. New users are presented with three illustrative onboarding slides explaining the app's value proposition before being directed to sign-up.

### Authentication
- **Email / Password** sign-up and sign-in with Firebase Auth.
- **Google Sign-In** via OAuth.
- **Password reset** via email link.
- A fresh-install keychain-wipe guard (see [§9](#9-authentication)) prevents iOS from silently restoring a stale session after app deletion.

### Dietary Profiling (Onboarding Questionnaire)
A multi-step questionnaire collects:

| Field | Options |
|---|---|
| **Diet Pattern** | Vegetarian, Eggetarian, Non-Veg, Pescatarian, Vegan, Jain |
| **Cuisine Region** | North, South, East, West Indian |
| **Goal** | Lose weight, Maintain, Gain muscle, Gain weight (healthy), Eat healthier |
| **Activity Level** | Sedentary → Athlete (5 levels) |
| **Spice Tolerance** | Mild → Very Hot |
| **Cooking Frequency** | Daily / Weekends only / Rarely |
| **Skill Level** | Beginner / Intermediate / Advanced |
| **Allergies** | Multi-select free-form tags |
| **Age, Weight, Height** | For TDEE calculation |

On submission the profile is POSTed to the backend, which uses the profile to compute the user's TDEE and calorie targets, and immediately generates the first day's meal plan. The user is taken to a **"Your Plan"** summary screen before landing on the main dashboard.

### Dashboard (Today's Meals)
The core screen shows three meal cards — Breakfast, Lunch, and Dinner — plus an ambient calorie ring visualisation. Each card supports:

- **Mark as Eaten** — logs the meal with an optional serving size stepper.
- **Swap Recipe** — triggers the backend engine to re-score candidates for that slot and returns the next best recipe.
- **Add Custom Meal** — free-form entry by the user (name + macros).
- **Recipe Detail** — tapping the card navigates to a full recipe detail screen (ingredients, method, nutrition breakdown).

A **greeting card** at the top personalises the header with the user's first name and time-of-day.

A **tomorrow preview** screen (reachable from the dashboard) shows the next day's planned meals.

### Week View
A horizontal weekly calendar that lets users browse the full 7-day plan at a glance, tap any day, and explore its meal detail.

### Chat (Gemini-Powered Assistant)
A conversational interface backed by the **Gemini API** (the **only** part of the system that uses a language model). The meal plan engine is entirely separate. The chat supports:
- Nutrition questions answered in natural language with recipe suggestions.
- Inline **recipe cards** in chat messages that navigate directly to the Recipe Detail screen.

> **Note:** Recipes generated by the chat assistant are stored in the DB with `source=RECIPE_SOURCE_AI` and are **explicitly excluded** from the meal plan engine's candidate pool. The two systems are fully decoupled.

### Profile & Settings
- **Edit Profile** — update display name.
- **Notifications Settings** — toggle push notifications and register/unregister the FCM device token with the backend.
- **Monthly Report** — a nutrient summary report.
- **Sign Out** — clears session, invalidates Riverpod keepAlive providers, wipes the Hive cache, and deletes the FCM token.

### Notifications
- An in-app **notifications list** screen showing all system and meal-related push notifications.
- An **unread badge** on the bottom-nav that refreshes reactively whenever a push arrives (via a broadcast stream from `PushMessagingService`).

---

## 3. Meal Plan Engine & Calorie Formula

This is one of the most important things to understand about Ahara: **meal plans are generated by a deterministic rule-based engine, not a language model.** The Gemini API is only used in the Chat feature. The meal plan engine lives in `apps/mealplans/services/engine.py` on the backend.

### The Scoring Engine

Each time a daily plan is generated (or a slot is swapped), the engine runs these steps in order:

**Step 1 — Hard Filters (DB queries, candidates must pass all)**

| Filter | Logic |
|---|---|
| Meal type | `breakfast` / `lunch` / `dinner` slot match |
| Diet pattern | Matches user's diet (vegetarian, jain, vegan, etc.) |
| Allergen exclusion | None of the user's allergens present |
| Calorie window | Within ±25–50% of the slot's target kcal |
| Budget | Within user's per-meal budget cap |

> AI-generated recipes (created via the Chat feature) are **explicitly excluded** at this stage via `exclude(source=RECIPE_SOURCE_AI)`. The chat and the meal plan are fully decoupled.

**Step 2 — Weighted Scoring (highest score wins)**

| Signal | Score delta |
|---|---|
| Cuisine region matches user preference | +30 |
| Macro proximity (protein/carbs/fat closeness to target) | +0 to +20 |
| Recipe seen in the last 7 days (variety penalty) | −50 |
| Budget fit | +25 |
| Budget overshoot | −overshoot amount |
| Quick recipe (≤ 30 min) for daily-cook users | +15 |
| High fibre for `eat_healthier` goal | +15 |
| Same protein source as yesterday (non-veg only) | −25 |
| Random tiebreaker | +0 to +5 |

The highest-scoring candidate is selected. A `select_recipe_with_fallback` hook is stubbed for a future AI fallback but is **not wired into any live view**.

---

### Calorie Formula — Mifflin-St Jeor

The backend computes each user's daily calorie target using the **Mifflin-St Jeor equation (1990)** — the globally accepted clinical standard recommended by the Academy of Nutrition and Dietetics and validated as the most accurate RMR prediction in multiple independent meta-analyses (accurate within ±10% for ~82% of individuals, versus ~66% for the older Harris-Benedict equation).

```
BMR (male)   = (10 × weight_kg) + (6.25 × height_cm) − (5 × age) + 5
BMR (female) = (10 × weight_kg) + (6.25 × height_cm) − (5 × age) − 161
BMR (other)  = arithmetic average of male and female formulas (bmr_base − 78)

TDEE         = BMR × activity_multiplier
Target kcal  = max(1200, round(TDEE + goal_delta))
```

**Activity multipliers** (standard Katch-McArdle / Harris-Benedict PAL factors):

| Level | Multiplier |
|---|---|
| Sedentary | 1.2 |
| Light (1–3 days/week) | 1.375 |
| Moderate (3–5 days/week) | 1.55 |
| Very active (6–7 days/week) | 1.725 |
| Athlete (2× daily) | 1.9 |

**Goal deltas** adjust TDEE up or down based on the user's stated goal (e.g. calorie deficit for weight loss, surplus for muscle gain).

**Calorie floor of 1,200 kcal** is the standard minimum used in clinical dietetics practice.

**Honest engineering caveat:** There is no established clinical formula for non-binary individuals. The `prefer_not_to_say` sex case uses the arithmetic average of the male and female BMR results, which produces `bmr_base − 78`. This is the standard fallback used across most clinical and consumer nutrition software.

---

## 4. Architecture

Ahara is built on a **Feature-first, Layered Architecture** with clean separation between data, domain, and presentation. The pattern is consistent across every feature.

```
lib/
├── core/           # App-wide cross-cutting concerns
├── features/       # Vertical feature slices
│   ├── auth/
│   ├── onboarding/
│   ├── dashboard/
│   ├── week/
│   ├── chat/
│   ├── profile/
│   └── notifications/
└── shared/
    └── models/     # DTOs shared between features
```

Each feature follows the same three-layer contract:

```
feature/
├── data/
│   ├── <feature>_remote_datasource.dart   # Raw HTTP calls via Dio
│   └── <feature>_repository.dart          # Wraps DS, returns Result<T>
├── domain/
│   └── models/                            # Freezed immutable value objects
└── presentation/
    ├── controllers/                        # Riverpod AsyncNotifiers
    ├── screens/                            # Stateless/Stateful widgets
    └── widgets/                            # Feature-scoped UI components
```

### Layer Responsibilities

| Layer | Responsibility | What it returns |
|---|---|---|
| **DataSource** | Raw HTTP calls, JSON parsing, `dev.log` tracing | Plain Dart objects |
| **Repository** | Error wrapping, cache integration, business rules | `Result<T>` |
| **Controller** | Unwraps `Result<T>`, drives `AsyncNotifier` state | `AsyncValue<T>` |
| **Screen / Widget** | Renders `AsyncValue` with loading/error/data states | Flutter widgets |

**No raw exceptions escape the repository layer.** This is enforced architecturally — datasources throw, repositories catch and wrap into typed `Result<T>`.

---

## 5. Folder Structure

```
lib/
├── main.dart                        # Entry point — Firebase init, Hive init, fresh-install guard
├── app.dart                         # Root widget, lifecycle observer, offline banner, toast overlay
├── firebase_options.dart            # Generated Firebase config (per-platform)
│
├── core/
│   ├── analytics/
│   │   └── analytics_service.dart   # Firebase Analytics wrapper
│   ├── cache/
│   │   ├── cache_service.dart       # Hive-backed read cache
│   │   └── cached_fetch.dart        # stale-while-revalidate fetch helper
│   ├── config/
│   │   └── env.dart                 # .env reader (API base URL, etc.)
│   ├── connectivity/
│   │   └── connectivity_provider.dart  # Online/offline stream + refresh notifier
│   ├── extensions/                  # Dart extension methods
│   ├── network/
│   │   ├── api_client.dart          # Dio instance (keepAlive Riverpod provider)
│   │   ├── api_exceptions.dart      # Sealed exception hierarchy
│   │   ├── auth_interceptor.dart    # Attaches Firebase ID token
│   │   ├── error_interceptor.dart   # Maps DioException → AppException
│   │   ├── analytics_interceptor.dart # Logs every API call to Firebase Analytics
│   │   └── envelope.dart            # Parses {status, data} response envelope
│   ├── notifications/
│   │   └── push_messaging_service.dart  # FCM + flutter_local_notifications
│   ├── providers/
│   │   ├── app_lifecycle_provider.dart  # Background-timeout trigger
│   │   └── toast_provider.dart          # Global toast system
│   ├── routing/
│   │   ├── app_router.dart          # GoRouter config + auth redirect logic
│   │   └── route_paths.dart         # Typed route path constants
│   ├── theme/
│   │   ├── app_colors.dart          # Brand color tokens
│   │   ├── app_radius.dart          # Border radius tokens
│   │   ├── app_shadows.dart         # Shadow tokens
│   │   ├── app_spacing.dart         # Spacing scale
│   │   ├── app_theme.dart           # ThemeData factory (Material 3)
│   │   └── app_typography.dart      # TextStyle tokens (Google Fonts)
│   ├── utils/
│   │   ├── result.dart              # Sealed Result<T> type
│   │   ├── formatters.dart          # Date/number formatters
│   │   └── validators.dart          # Form validators
│   └── widgets/                     # 20+ design-system components
│       ├── app_bottom_nav.dart
│       ├── app_button.dart
│       ├── app_card.dart
│       ├── app_chip.dart
│       ├── app_modal_sheet.dart
│       ├── app_scaffold.dart
│       ├── app_text_field.dart
│       ├── app_toast.dart
│       ├── calorie_ring.dart
│       ├── empty_state.dart
│       ├── error_state.dart
│       ├── loading_state.dart
│       ├── macro_progress_bar.dart
│       ├── meal_card.dart
│       ├── nutrition_row.dart
│       ├── offline_banner.dart
│       ├── section_header.dart
│       ├── selectable_card.dart
│       ├── servings_stepper.dart
│       └── settings_list_item.dart
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── auth_remote_datasource.dart
│   │   │   └── auth_repository.dart
│   │   ├── domain/models/
│   │   │   ├── auth_state.dart      # Sealed: unauthenticated | loading | authenticated(User)
│   │   │   └── user_model.dart
│   │   ├── presentation/
│   │   │   ├── controllers/
│   │   │   │   ├── auth_controller.dart      # keepAlive AsyncNotifier
│   │   │   │   ├── login_controller.dart
│   │   │   │   └── splash_controller.dart
│   │   │   ├── screens/
│   │   │   │   ├── splash_screen.dart
│   │   │   │   ├── onboarding_slides_screen.dart
│   │   │   │   └── login_screen.dart
│   │   │   └── widgets/
│   │   └── providers.dart           # Feature-scoped DI bindings
│   │
│   ├── onboarding/
│   │   ├── domain/models/
│   │   │   ├── dietary_profile.dart     # Freezed, JSON serialisable
│   │   │   ├── onboarding_enums.dart    # Sex, ActivityLevel, Goal, CuisineRegion, ...
│   │   │   ├── onboarding_form_data.dart
│   │   │   ├── onboarding_state.dart
│   │   │   └── questionnaire.dart
│   │   └── presentation/screens/
│   │       ├── onboarding_screen.dart
│   │       └── your_plan_screen.dart
│   │
│   ├── dashboard/
│   │   ├── data/
│   │   │   ├── dashboard_remote_datasource.dart
│   │   │   └── dashboard_repository.dart  # All reads use cachedFetch()
│   │   ├── domain/
│   │   │   ├── meal_timing.dart
│   │   │   └── models/
│   │   │       ├── daily_nutrition.dart
│   │   │       ├── meal_card_state.dart
│   │   │       ├── meal_log.dart
│   │   │       ├── recipe_detail.dart
│   │   │       ├── recipe_slim.dart
│   │   │       └── today_meal_plan.dart
│   │   └── presentation/
│   │       ├── controllers/dashboard_controller.dart
│   │       ├── screens/
│   │       │   ├── dashboard_screen.dart
│   │       │   ├── recipe_detail_screen.dart
│   │       │   └── tomorrow_preview_screen.dart
│   │       └── widgets/dashboard/
│   │           ├── ambient_calorie_viz.dart
│   │           ├── custom_meal_sheet.dart
│   │           ├── dashboard_meal_card.dart
│   │           ├── greeting_card.dart
│   │           ├── log_chooser_sheet.dart
│   │           ├── mark_as_eaten_sheet.dart
│   │           ├── meal_options_sheet.dart
│   │           └── swap_sheet.dart
│   │
│   ├── week/          # Weekly calendar view
│   ├── chat/          # AI chat interface
│   ├── profile/       # User profile + settings
│   └── notifications/ # FCM device registration + in-app list
│
└── shared/
    └── models/        # Cross-feature shared DTOs
```

---

## 6. State Management — Riverpod

Ahara uses **Riverpod 3.x** with **code generation** (`riverpod_annotation`, `riverpod_generator`) throughout. This enables:

- Compile-time provider type safety.
- Auto-generated `.g.dart` files so provider declarations are minimal and readable.
- `@Riverpod(keepAlive: true)` for singleton services (router, API client, auth).
- `autoDispose` (the default) for screen-scoped state that GCs when the screen leaves the tree.

### Provider Taxonomy

| Provider Type | Usage in Ahara |
|---|---|
| `@riverpod` function | Stateless services — `apiClient`, `analyticsService`, `pushMessagingService` |
| `AsyncNotifier` | Async feature state — `AuthController`, `DashboardController`, `LoginController` |
| `Notifier` | Sync stateful values — `OnlineRefreshNotifier`, `ToastNotifier` |
| `StreamProvider` | Reactive streams — `connectivityStatusProvider` |
| Manual `Provider` | Non-generated singletons — `cacheServiceProvider`, `analyticsServiceProvider` |

### Reactive Auth → Router Coupling

The router does not poll auth state. Instead, `AppRouter` creates an `_AuthNotifier` (`ChangeNotifier`) that is passed as `refreshListenable` to GoRouter. The `AuthController` is listened to with `ref.listen`, and any change calls `notifier.update(next)`, which triggers `notifyListeners()`, which makes GoRouter re-evaluate its redirect logic — all without recreating the router instance.

```dart
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final notifier = _AuthNotifier(ref.read(authControllerProvider));
  ref.listen<AsyncValue<AuthState>>(authControllerProvider, (_, next) {
    notifier.update(next);
  });
  // ...
  final router = GoRouter(refreshListenable: notifier, redirect: _redirect, ...);
  return router;
}
```

### Sign-Out Provider Cleanup

On sign-out, `AuthController` explicitly **invalidates keepAlive providers** whose data is user-scoped (`dashboardControllerProvider`, `unreadCountControllerProvider`, `pushSettingsControllerProvider`). Without this, Riverpod's keepAlive cache would serve the previous user's data to the next account until app restart.

---

## 7. Navigation — GoRouter

Ahara uses **GoRouter 14.x** with a `StatefulShellRoute.indexedStack` for the bottom-nav shell and nested `GoRoute`s for sub-screens within each tab.

### Route Tree

```
/splash
/onboarding-intro
/login
/onboarding
/your-plan

StatefulShellRoute (bottom nav)
├── /home                         ← Dashboard
│   ├── recipe/:slug              ← Recipe detail
│   ├── notifications             ← Notification list
│   └── tomorrow                  ← Tomorrow preview
├── /recipes                      ← Week view
├── /chat                         ← AI chat
│   └── recipe/:slug              ← Recipe detail from chat
└── /profile                      ← Profile
    ├── edit                      ← Edit profile
    ├── report                    ← Monthly report
    └── notifications             ← Push notification settings
```

### Declarative Auth Redirect Logic

All routing decisions are pure functions with no side effects:

```
Auth loading                  → stay on /splash, block all other routes
Unauthenticated               → allow /splash, /onboarding-intro, /login only
Authenticated (no profile)    → redirect to /onboarding
Authenticated (has profile)   → redirect away from auth routes to /home
```

### Crossfade Transitions

All route changes use a **plain crossfade** (`FadeTransition`) via a custom `_fadePage` helper. This avoids the default platform slide/fade-up that flashes white between screens. Critically, every `CustomTransitionPage` receives a **stable `state.pageKey`** — without it, every `refreshListenable` fire creates a fresh keyless page that the Navigator cannot match to the existing route entry, causing it to remount and re-dispose providers (producing infinite refetch loops on detail screens).

---

## 8. Network Layer

The network stack is built on **Dio 5.x** configured with a single `keepAlive` Riverpod provider. Every outgoing request passes through a chain of interceptors in order:

```
Request → AuthInterceptor → ErrorInterceptor → AnalyticsInterceptor
                                ↓
Response ← EnvelopeParser ← Dio response
```

### Interceptors

| Interceptor | Responsibility |
|---|---|
| `AuthInterceptor` | Attaches the Firebase ID token as `Authorization: Bearer <token>` on every request. On 401, silently refreshes the token and retries once. |
| `ErrorInterceptor` | Maps every `DioException` to a typed `AppException` subclass. Handles timeout, socket, bad response, and format exceptions with distinct types. |
| `AnalyticsInterceptor` | Logs every completed/failed API call to Firebase Analytics with status code and envelope status. |
| `LogInterceptor` | Active only in `kDebugMode` — logs full request/response bodies to the Dart developer console. |

### Response Envelope

All API responses follow a standard envelope:

```json
// Success
{ "status": "success", "message": "...", "data": { ... } }

// Error
{ "status": "error", "message": "Human-readable", "error": { "code": "MACHINE_CODE", "details": {} } }
```

`EnvelopeParser` is a utility class with `parseSuccess<T>()` and `parseSuccessList<T>()` generics, and `_parseError()` that maps backend error codes (`NOT_AUTHENTICATED`, `VALIDATION_ERROR`, `PROFILE_NOT_FOUND`, `REGENERATE_LIMIT`, etc.) to the correct `AppException` subtype.

---

## 9. Offline-First & Caching

Ahara implements a **stale-while-network-error** caching strategy using **Hive** as the local store.

### CacheService

`CacheService` wraps a `Box<String>` (Hive) and exposes four operations:

- `write(key, json)` — serialises any Map/List to JSON and stores it.
- `readMap(key)` — returns a cached `Map<String, dynamic>` or `null`.
- `readList(key)` — returns a cached `List<dynamic>` or `null`.
- `clearAll()` — wipes all entries on sign-out (prevents cross-account data leakage).

The `CacheService` instance is **injected into the Riverpod scope** at app startup via a `Provider.overrideWithValue()` after Hive initialises. Accessing the provider without the override throws a `StateError` at runtime — a deliberate fail-fast guard.

### cachedFetch / cachedFetchList

Every repository GET method uses the `cachedFetch` helper:

```dart
Future<Result<TodayMealPlan>> getTodayMealPlan() => cachedFetch(
  cache: _cache,
  key: 'dashboard:today_plan',
  fetch: _ds.fetchTodayMealPlan,
  toJson: (v) => v.toJson(),
  fromJson: TodayMealPlan.fromJson,
);
```

The helper:
1. Tries `fetch()`.
2. On **success** → writes to cache, returns `Success(data)`.
3. On **offline error** (`NetworkException` or `TimeoutException`) → tries `cache.readMap(key)`. If found, returns `Success(cachedData)` transparently.
4. On **any other error** (401, 404, 429, 5xx) → returns `Failure(exception)` — these are real server answers, not offline conditions.

### Connectivity-Triggered Refetch

`OnlineRefreshNotifier` watches `connectivityStatusProvider` (a `StreamProvider<bool>`) and bumps a revision counter only on a genuine **offline → online transition**. Controllers `ref.listen` this counter and silently re-invoke their `build` method when it increments, making the app automatically refresh from the network when connectivity is restored.

### Offline Banner

`OfflineBannerOverlay` (injected globally in `app.dart`'s `builder`) watches `connectivityStatusProvider` and renders a non-intrusive banner at the top of the screen when offline. It uses animated height transitions so the banner slides in and out smoothly.

---

## 10. Authentication

### Firebase Auth + Backend Registration

Ahara uses **Firebase Auth as the identity provider** and a custom Django backend as the application server. The auth flow is:

1. User signs in with Firebase (email/password or Google OAuth).
2. `AuthRepository.register()` is called — it POSTs to `/auth/register/` with the Firebase ID token.
3. The backend upserts a user record and returns the full user object (including `hasProfile`).
4. `AuthController` stores the authenticated state; GoRouter's redirect logic picks up the change and routes to onboarding or home.

### Fresh-Install Keychain Guard

iOS Keychain persists Firebase Auth sessions across app deletions. On reinstall, `SharedPreferences` (which *is* wiped on deletion) is missing the `has_launched_before` key — this is used as a sentinel:

```dart
const _kHasLaunchedKey = 'has_launched_before';
final prefs = await SharedPreferences.getInstance();
if (prefs.getBool(_kHasLaunchedKey) != true) {
  await fb.FirebaseAuth.instance.signOut();
  await prefs.setBool(_kHasLaunchedKey, true);
}
```

This prevents a reinstalled app from silently restoring a stale session.

### Token Refresh on 401

`AuthInterceptor` catches 401 responses, silently calls `FirebaseAuth.instance.currentUser!.getIdToken(true)` to force-refresh the token, and retries the original request with the new token — invisible to the user.

### Firebase Auth Error Mapping

`AuthRepository._mapFirebaseError()` uses a Dart 3 `switch` expression to convert every Firebase error code to a typed `AppException`, providing human-readable messages for invalid-email, email-already-in-use, weak-password, wrong-password, user-not-found, user-disabled, too-many-requests, and operation-not-allowed.

---

## 11. Firebase Integration

| Firebase Product | Usage |
|---|---|
| **Firebase Auth** | Primary identity provider — email/password + Google OAuth |
| **Firebase Analytics** | Screen views (every navigation event) + API call telemetry |
| **Firebase Crashlytics** | Flutter framework errors, platform errors, and all uncaught exceptions via `runZonedGuarded` |
| **Firebase Messaging (FCM)** | Push notifications — foreground display, background/killed handling, cold-start navigation |

### FCM Architecture

`PushMessagingService` handles the complete push lifecycle:

- **Foreground messages** — rendered as heads-up local notifications via `flutter_local_notifications` (the OS auto-suppresses FCM while the app is in the foreground, so we take over).
- **Background/killed messages** — handled by a `@pragma('vm:entry-point')` top-level function that reinitialises Firebase.
- **Tap navigation** — both warm-start (`onMessageOpenedApp`) and cold-start (`getInitialMessage`) taps navigate to the appropriate in-app route via `_pathFor()`.
- **Token lifecycle** — `getToken()` on init, `onTokenRefresh` stream re-registration, `deleteToken()` on sign-out.

### Crashlytics Error Capture

Three layers of Crashlytics integration:

```dart
// 1. Flutter framework errors
FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

// 2. Platform/async errors
PlatformDispatcher.instance.onError = (error, stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  return true;
};

// 3. All other uncaught Dart errors
await runZonedGuarded(() async { ... }, (error, stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
});
```

### Firebase Analytics

`AnalyticsService` is a thin, safe wrapper over `FirebaseAnalytics` that logs two event types:

| Event | When it fires | Parameters |
|---|---|---|
| `screen_viewed_<route>` | Every navigation event (push, pop, tab switch, redirect) | `route` — the raw URI path |
| `api_call` | Every HTTP request completed or failed (via `AnalyticsInterceptor`) | `status_code`, `api_status`, `message` |

The router's `routerDelegate` listener fires `logCurrentRoute()` on every configuration change, so screen-view tracking requires zero per-screen boilerplate. Event names are sanitised to Firebase's 40-character alphanumeric constraint and values are clamped to 100 characters, both enforced inside `AnalyticsService` so callers can pass raw routes and endpoints without worrying about SDK limits. All calls are wrapped in a `_safe()` guard — analytics failures are silently swallowed and never interrupt a user flow.

---

## 12. Design System

Ahara has a **token-based design system** with zero hardcoded values in feature widgets. All visual constants are defined in `core/theme/` and consumed via named references.

### Color Palette

Three brand anchors with semantic extensions:

| Token | Hex | Usage |
|---|---|---|
| `navyDeep` | `#1E1B2E` | Dark backgrounds, primary text, heavy UI elements |
| `navyMid` | `#2A2640` | Cards on dark surfaces |
| `turmeric` | `#F5A623` | Primary CTA accent, active states, logo sun |
| `cream` | `#FDFAF4` | Page canvas |
| `creamDeep` | `#F2EFE4` | Card surfaces, bottom sheets |
| `macroProtein` | `#C2541E` | Protein macro bar |
| `macroCarbs` | `#E0A53F` | Carbohydrate macro bar |
| `macroFat` | `#D98A9E` | Fat macro bar |
| `macroFiber` | `#7BA88E` | Fibre macro bar |

### Typography

Google Fonts (loaded via `google_fonts` package) with a consistent 7-level type scale: `displayLarge`, `displayMedium`, `headingLarge`, `headingMedium`, `bodyLarge`, `bodyMedium`, `labelLarge`, `labelMedium`, `caption`.

### Spacing & Radius

`AppSpacing` and `AppRadius` define an 8pt grid system with named values (`xs=4`, `sm=8`, `md=16`, `lg=24`, `xl=32`, `xxl=48`) and radius tokens (`card`, `button`, `pill`, `modal`).

### Material 3 Theme

`AppTheme.light()` constructs a `ThemeData` using `ColorScheme.fromSeed` with exact brand overrides. Every component theme (`AppBarTheme`, `CardTheme`, `InputDecorationTheme`, `ElevatedButtonTheme`, `BottomNavigationBarTheme`, `ChipTheme`) is configured so that the default Material component appearance matches the design with no per-widget style overrides.

### Reusable Widget Library

20+ shared widgets in `core/widgets/`:

- **`AppButton`** — Primary / secondary / destructive / loading variants.
- **`AppTextField`** — Consistent inputs with error state support.
- **`AppCard`** — Styled card container.
- **`AppChip`** — Selectable filter chips.
- **`AppToast`** — Auto-dismissing global toast overlay (success/error/info).
- **`CalorieRing`** — Animated circular progress indicator for daily calorie target.
- **`MacroProgressBar`** — Coloured progress bars for protein, carbs, fat, fibre.
- **`MealCard`** — Reusable meal card for week view.
- **`EmptyState` / `ErrorState` / `LoadingState`** — Standard tri-state screen templates.
- **`OfflineBanner`** — Global animated offline indicator.
- **`SelectableCard`** — Multi-select card for onboarding questionnaire options.
- **`ServingsStepper`** — Increment/decrement stepper for meal logging.
- **`SettingsListItem`** — Consistent list items for settings screens.

---

## 13. Data Modelling — Freezed & JSON

All domain models are **Freezed** (`freezed_annotation`, `build_runner`) — immutable value objects with:

- `==` / `hashCode` structural equality.
- `copyWith` for immutable updates.
- `when` / `maybeWhen` / `map` pattern matching.
- `@JsonSerializable` for JSON serialisation via `json_annotation` / `json_serializable`.

**Example — `DietaryProfile`** carries the full onboarding questionnaire and is:
- **Passed as `GoRoute` extra** from onboarding to the `YourPlanScreen`.
- **JSON serialisable** so GoRouter can reconstruct it if the route state is serialised (e.g., after a `refreshListenable` rebuild).

**Example — `AuthState`** is a **sealed Freezed union**:

```dart
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.loading()         = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
}
```

Enums are annotated with `@JsonValue` so they serialise to the exact strings the backend expects (`'north_indian'`, `'lose_weight'`, etc.).

---

## 14. Error Handling Strategy

Ahara has a **stratified, typed error system** — no `try/catch Object` leaks past the repository boundary into the UI.

### AppException Sealed Hierarchy

```dart
sealed class AppException
├── NetworkException      // No connectivity
├── TimeoutException      // connect/receive timeout
├── UnauthorizedException // 401 — triggers token refresh + retry
├── ValidationException   // 400 — carries per-field Map<String, List<String>>
├── NotFoundException     // 404
├── RateLimitException    // 429
├── ServerException       // 5xx
└── UnknownException      // Catch-all
```

### Error Flow

```
DioException
    ↓ ErrorInterceptor._mapException()
AppException (typed)
    ↓ DataSource (re-throws)
Result<T> = Failure(exception)   ← Repository wraps here
    ↓ Controller.build()
AsyncError(exception)            ← Riverpod state
    ↓ Widget.when(error:)
ErrorState widget                ← User-facing error with retry button
```

### Toast-Driven User Messages

All user-facing messages go through `toastProvider` — never rendered inline in the UI. Controllers call `ref.read(toastProvider.notifier).show(msg)` for errors and `.show(msg, type: ToastType.success)` for confirmations. The toast auto-dismisses after 2 seconds. This keeps screens message-free and all notification logic in one place.

---

## 15. Key Engineering Principles

### 1. Sealed Types Over Stringly-Typed Logic
Dart 3's `sealed class` is used for `AppException`, `AuthState`, and `Result<T>`. Pattern matching via `switch` expressions ensures exhaustiveness and eliminates `if/else` chains.

### 2. No Raw Exceptions in the UI
The repository layer is the error boundary. Everything above it works with `Result<T>` or `AsyncValue<T>`. Widgets never `try/catch`.

### 3. Code Generation Over Boilerplate
`freezed`, `json_serializable`, and `riverpod_generator` eliminate an entire category of hand-written boilerplate — equality, JSON, and provider wiring are all generated and never diverge.

### 4. Single Source of Truth for Design Tokens
`AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`, `AppShadows` are the only place where visual values live. Feature code imports tokens by name; no hex literals or magic numbers appear in widget files.

### 5. Dependency Injection via Riverpod, Not Service Locators
Every dependency (repository, service, client) is a Riverpod provider. Overrides in `ProviderScope` (e.g., `cacheServiceProvider.overrideWithValue(...)`) allow clean injection at startup without global singletons or `GetIt`-style locators.

### 6. Stable Route Keys Prevent Infinite Loops
The custom `_fadePage` helper's requirement for `key: state.pageKey` is a deliberate, documented engineering decision. Without a stable key, Riverpod `autoDispose` providers watched by detail screens are disposed and recreated on every router rebuild, producing refetch loops.

### 7. Lifecycle-Aware Session Management
`AharaApp` implements `WidgetsBindingObserver` and measures time spent in background. After 10 minutes, the app navigates back to `/splash` to re-run the auth gate — preventing stale sessions from being visible when the user reopens the app.

### 8. Analytics as a Side Effect, Never a Blocker
`AnalyticsService` wraps every Firebase Analytics call in a `_safe()` method that swallows exceptions. Analytics must never interrupt a user flow.

### 9. `dev.log` Over `print`
All logging uses `dart:developer`'s `log()` with a named scope (`'API'`, `'Auth'`, `'CACHE'`, `'Push'`, `'ANALYTICS'`). This integrates with the Dart DevTools logging panel and is stripped from release builds.

### 10. Files Under 500 Lines
Every file in the codebase is kept under 500 lines. Screens that grow large extract sub-widgets into separate files within the same feature's `widgets/` directory.

---

## 16. Tech Stack Summary

| Category | Technology | Version |
|---|---|---|
| **Language** | Dart | 3.10+ |
| **Framework** | Flutter | 3.x |
| **State Management** | Riverpod + riverpod_generator | 3.x |
| **Navigation** | GoRouter | 14.x |
| **HTTP Client** | Dio | 5.x |
| **Authentication** | Firebase Auth + Google Sign-In | Latest |
| **Push Notifications** | Firebase Cloud Messaging + flutter_local_notifications | Latest |
| **Analytics** | Firebase Analytics | Latest |
| **Crash Reporting** | Firebase Crashlytics | Latest |
| **Local Storage** | Hive + hive_flutter | 2.x |
| **Preferences** | SharedPreferences | Latest |
| **Code Generation** | Freezed + json_serializable + riverpod_generator | Latest |
| **Image Loading** | cached_network_image | Latest |
| **Fonts** | Google Fonts (via google_fonts package) | Latest |
| **Connectivity** | connectivity_plus | 6.x |
| **Linting** | very_good_analysis + riverpod_lint + custom_lint | Latest |
| **Build Runner** | build_runner | 2.x |

---

## 17. Getting Started

### Prerequisites

- Flutter SDK `^3.10.0`
- Dart SDK `^3.10.7`
- A Firebase project with Auth, Analytics, Crashlytics, and FCM enabled
- Android SDK (API 21+) or Xcode (iOS 12+)

### Setup

```bash
# 1. Clone the repository
git clone <repo-url>
cd nutri-app-mobile

# 2. Copy the environment file and fill in your API base URL
cp .env.example .env
# Edit .env: AHARA_API_BASE_URL=https://your-backend.example.com/api/v1

# 3. Add your google-services.json (Android) to android/app/
#    Add your GoogleService-Info.plist (iOS) to ios/Runner/

# 4. Install dependencies
flutter pub get

# 5. Run code generation (Freezed + JSON + Riverpod)
dart run build_runner build --delete-conflicting-outputs

# 6. Run the app
flutter run
```

### Code Generation

Whenever you add or modify a `@freezed`, `@JsonSerializable`, or `@riverpod` annotated class:

```bash
dart run build_runner build --delete-conflicting-outputs
```

For watch mode during active development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Regenerating App Icons

After replacing `assets/app_icon.png` or `assets/app_icon_foreground.png`:

```bash
dart run flutter_launcher_icons
```

---

<div align="center">

Built with care for the Indian food culture. 🍛

*"Let food be thy medicine and medicine be thy food."*

</div>
