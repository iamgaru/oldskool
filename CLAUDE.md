# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

OldSkool is a modern SwiftUI watchOS app that provides a retro terminal aesthetic on Apple Watch. Inspired by TermiWatch, this app displays system information, health metrics, and other data in a command-line style interface.

## Technology Stack

- **Platform**: watchOS 11.5+
- **Framework**: SwiftUI (native, no legacy dependencies)
- **Language**: Swift with async/await
- **Target Device**: Apple Watch Series 7+ (45mm optimized)
- **Dependencies**: 100% native Apple frameworks (no third-party dependencies)

## Development Commands

This is a standard Xcode watchOS project. Use Xcode for development:

```bash
# Open project in Xcode
open OldSkool.xcodeproj

# Build from command line (if needed)
xcodebuild -project OldSkool.xcodeproj -scheme "OldSkool Watch App" -destination "platform=watchOS Simulator,name=Apple Watch Series 7 - 45mm"
```

## Architecture

### Core Components

- **ContentView**: Main terminal interface with 10 widget slots
- **TerminalWidget**: Base protocol for all display widgets
- **DataProviders**: Async data fetching for health, weather, stocks
- **TimeHidingManager**: Digital Crown integration for time hiding
- **TerminalTheme**: Consistent styling (monospace font, green text)

### Widget System

The app displays 10 terminal-style "widgets" in a scrollable interface:
1. Time display
2. Date display  
3. Weather/temperature
4. Battery level
5. Activity rings
6. Step count
7. Heart rate
8. Stock price
9. [Available for new feature]
10. [Available for new feature]

### Data Integration

- **HealthKit**: Activity data, heart rate (async/await)
- **WeatherKit**: Native weather data (no API keys)
- **URLSession**: Stock price fetching
- **WKInterfaceDevice**: Battery and system info

## Design Principles

- **Terminal Aesthetic**: Monospace fonts, green text on black background
- **Modern APIs**: Use latest watchOS capabilities and async/await
- **No Dependencies**: Pure Swift/SwiftUI implementation
- **Series 7+ Optimized**: Take advantage of larger screen real estate
- **Accessibility**: Support VoiceOver and accessibility features

## File Structure

```
OldSkool/
├── OldSkool Watch App/
│   ├── ContentView.swift          # Main terminal interface
│   ├── Models/
│   │   ├── TerminalWidget.swift   # Widget protocol
│   │   └── HealthData.swift       # Health metrics model
│   ├── Views/
│   │   ├── Widgets/               # Individual widget views
│   │   └── Components/            # Reusable UI components
│   ├── Services/
│   │   ├── HealthService.swift    # HealthKit integration
│   │   ├── WeatherService.swift   # WeatherKit integration
│   │   └── StockService.swift     # Stock data fetching
│   └── Utilities/
│       ├── TerminalTheme.swift    # Styling constants
│       └── TimeHidingManager.swift # Digital Crown integration
└── OldSkool.xcodeproj
```

## Key Implementation Notes

- Use `@State` and `@StateObject` for SwiftUI state management
- Implement proper async/await patterns for data fetching
- Follow Apple's Human Interface Guidelines for watchOS
- Maintain consistent terminal styling across all widgets
- Handle watch sleep/wake states appropriately
- Optimize for battery life with efficient update cycles