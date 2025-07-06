# OldSkool

A modern SwiftUI Apple Watch app that brings retro terminal vibes to your wrist.

## Overview

OldSkool displays system information, health metrics, weather, and more in a classic command-line interface style. Inspired by [TermiWatch](https://github.com/kuglee/TermiWatch), this app is built from the ground up using modern SwiftUI and native watchOS APIs.

## Features

- **Terminal Aesthetic**: Monospace fonts, green text on black background
- **10 Data Widgets**: Time, date, battery, weather, steps, heart rate, activity rings, stock prices, system info, and status
- **Time Hiding**: Use Digital Crown to hide/show time display
- **Modern APIs**: Built with SwiftUI, async/await, HealthKit, WeatherKit
- **No Dependencies**: 100% native Swift implementation
- **Series 7+ Optimized**: Takes advantage of larger screen real estate

## Requirements

- watchOS 11.5+
- Apple Watch Series 7 or later (optimized for 45mm)
- Xcode 15.0+

## Installation

1. Clone this repository
2. Open `OldSkool.xcodeproj` in Xcode
3. Build and run on your Apple Watch

## Widgets

The app displays information in a terminal-style format:

```
user@watch:~ $ time        3:14:15 PM
user@watch:~ $ date        Jul 05, 2025
user@watch:~ $ battery     85%
user@watch:~ $ weather     72°F
user@watch:~ $ steps       8247
user@watch:~ $ heart_rate  68 bpm
user@watch:~ $ activity    245cal/12min/8hrs
user@watch:~ $ aapl        $189.42
user@watch:~ $ system      watchOS 11.5
user@watch:~ $ status      all systems nominal
```

## Permissions

The app requests access to:
- **HealthKit**: For activity rings, step count, and heart rate data
- **Location**: For weather information via WeatherKit

## Development

Built with modern Swift patterns:
- SwiftUI for all user interfaces
- async/await for data fetching
- @StateObject and @ObservedObject for state management
- Native Apple frameworks (no third-party dependencies)

## Architecture

- **Protocol-based widgets**: Each data source implements `TerminalWidget`
- **Service layer**: Separate services for HealthKit, WeatherKit, and stock data
- **Consistent theming**: Centralized styling in `TerminalTheme`
- **Async data loading**: All data fetching uses modern async/await patterns

## Credits

Inspired by [TermiWatch](https://github.com/kuglee/TermiWatch) by kuglee. OldSkool is a modern rewrite built with current SwiftUI and watchOS APIs.

## License

MIT License - see LICENSE file for details.