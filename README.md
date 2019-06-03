# manabie_challenge

Solution for Manabie Challenge.

## Getting Started

Follow instruction in [Get started](https://flutter.dev/docs/get-started/install) to setup project.

## Test

#### For unit tests, run this command:

```
flutter test
```

#### For integration test, run this command:

```
flutter drive --target=test_driver/app.dart
```

#### For testing requirements about rerendering widgets in notes:

> 1. Tapping on a card in the list view only rebuilds (build method is called) the detailed container (the list view must NOT be rebuilt).
> 2. Tapping on the detailed container only rebuilds the detailed container and the corresponding card in the list view (other cards in the list view must not be rebuit)

We must enable `Repaint Rainbow` to see which widget has been rerendered.

We can do that by changing the `main()` method in `lib/main.dart` to:

```
import 'package:flutter/rendering.dart';

void main(){
  debugRepaintRainbowEnabled = true;
  runApp(App());
}
```

or we can enable it in IDEs

- [Android Studio](https://flutter.dev/docs/development/tools/android-studio#debugging-visual-layout-issues)
- [VSCode](https://flutter.dev/docs/development/tools/vs-code#debugging-visual-layout-issues)
