# toggle_provider

A new Flutter project.

## FOLDER STRUCTURE:

```
lib/
│
├── provider/
│ ├── counter_provider.dart
│ ├── toggle_provider.dart
│ ├── slider_provider.dart
│ ├── opacity_provider.dart
│
├── consumer/
│ └── themeSwitch.dart
│
└── screens/
└── toggle_page.dart // Main UI Page
```
## How It Works

- The app initializes multiple providers using MultiProvider in main.dart.
- The TooglePage listens to these providers through Consumer widgets.
- Each section (counter, switch, slider) reacts only to changes in its own provider.
- The ThemeSwitch widget uses the theme provider to apply dark or light mode dynamically.

## Features:

- Live Counter — Displays real-time updating date/time and counter values.
- Dark / Light Theme Toggle — Uses a SwitchListTile to change the app theme dynamically.
- Slider Control — Adjusts opacity or value interactively through a SliderProvider.
- Multiple Providers — Demonstrates how to manage and consume several providers together.
- Efficient Consumer Usage — Prevents unnecessary rebuilds by using listen: false where appropriate.
- Image Background with Theme Overlay — Background image supports dark/light tint.
