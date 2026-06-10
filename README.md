# Fortune Cookie App

A simple Flutter app that fetches and displays a random fortune from a remote API.

## Overview

This app demonstrates a minimal Flutter architecture using:

- `Model` for API requests
- `ViewModel` for state management with `ChangeNotifier`
- `View` widgets driven by loaded data
- JSON parsing with Dart factory constructors

The main screen fetches a fortune message and its type from an external API and shows it in the UI.

## Features

- Fetches a random fortune from a remote endpoint
- Displays the fortune text and its type
- Uses `ListenableBuilder` to rebuild when data or loading state changes
- Shows loading, success, and error states in the UI

## Project structure

- `lib/main.dart` - App entrypoint
- `lib/views/fortune_view.dart` - Main screen and state-driven UI
- `lib/viewModel/fortune_cookie_view_model.dart` - Loads data and exposes app state
- `lib/model/fortune_cookie_model.dart` - Performs the HTTP request
- `lib/fortune_cookie.dart` - Data models and JSON parsing
- `lib/views/widgets/fortune_page.dart` - Fortune display page
- `lib/views/widgets/fortune_widget.dart` - Fortune text widget

## How it works

1. `main.dart` starts the app with `FortuneView`.
2. `FortuneView` creates `FortuneCookieViewModel` and calls `fetchCookie()` in `initState()`.
3. `FortuneCookieModel.getFortuneCookie()` sends an HTTP GET request to the configured API.
4. The JSON response is parsed into `FortuneCookie` and `Fortune` objects.
5. `FortuneView` rebuilds via `ListenableBuilder` and shows the loaded fortune.

## API integration

The app uses `http` to request data from:

```text
https://api.apiverve.com/v1/fortunecookie
```

The request includes an API key header:

```dart
headers: {'x-api-key': 'YOUR_API_KEY'}
```

The expected response format is:

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "fortune": "The best time to plant a tree...",
    "type": "wisdom"
  }
}
```

The data model extracts `data.fortune` and `data.type`.

## Important files

### `lib/main.dart`

Bootstraps the app and displays `FortuneView`.

### `lib/views/fortune_view.dart`

Handles the main UI state:

- shows a `CircularProgressIndicator` while loading
- shows an error message if the request fails
- shows the fortune page when data is available
- uses a fallback message for unexpected states

### `lib/viewModel/fortune_cookie_view_model.dart`

Manages app state and provides:

- `cookie` - loaded `FortuneCookie`
- `fortune` - convenience getter for `Fortune`
- `isLoading` and `error`
- `fetchCookie()` to refresh data

### `lib/model/fortune_cookie_model.dart`

Performs the HTTP GET request and decodes JSON into model objects.

### `lib/fortune_cookie.dart`

Defines:

- `FortuneCookie`
- `Fortune`

and factory constructors that parse the JSON response.

## Running the app

From the project root:

```bash
flutter pub get
flutter run
```

If you make changes to the startup state or the API request, do a full restart instead of hot reload.

## Customization

### Change the API key

Update the header value in `lib/model/fortune_cookie_model.dart`.

### Change the API endpoint

Update the URI in `lib/model/fortune_cookie_model.dart`.

### Display more fields

Extend `Fortune` and the UI widgets if the API returns additional data.

## Notes

- The current implementation uses a single `ChangeNotifier` and no additional state management package.
- For a production app, consider moving the API key into a secure configuration or environment variable.
- The app currently shows a placeholder fallback message when the state is unexpected.
