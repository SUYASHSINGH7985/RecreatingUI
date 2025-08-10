# RecreatingUI

A SwiftUI application demonstrating a sleek, modern cryptocurrency portfolio interface with exchange, record, and wallet screens — all designed with a consistent dark theme and smooth UI interactions.

---

## Project Overview

This project showcases building a multi-tab SwiftUI app focused on cryptocurrency portfolio management, designed with modular components and reactive state management. It highlights:

- **Crypto Portfolio Tab:** Displays the user’s total portfolio value with toggle between fiat (₹) and crypto (₿), a smooth Catmull-Rom spline line chart visualizing trends, quick asset cards for Bitcoin and Ethereum, and a list of recent transactions.
- **Exchange Tab:** Modal interface for exchanging cryptocurrencies, allowing ETH and INR input amounts, swap functionality, detailed rate/spread/gas fee information, and an exchange button.
- **Record Tab:** Scrollable list of recent user activity records with icons, titles, and dates presented in a clean card style.
- **Wallet Tab:** Placeholder screen with navigation setup, ready for future wallet management features.

The app is designed exclusively for **dark mode** with careful use of colors, gradients, and shadows to enhance depth and readability.

---

## Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/suyashsingh7985/RecreatingUI.git
   cd RecreatingUI
2.Open the project in Xcode:
- Open RecreatingUI.xcodeproj (or RecreatingUI.xcworkspace if using Swift Packages or CocoaPods).

3.Ensure Xcode version:
-Use Xcode 14 or later to ensure compatibility with SwiftUI features.

---
## Build & Run
- Open the project in Xcode.
- Select a simulator or physical device.
- Press Run (⌘ + R) to build and launch the app.
- The app targets iOS 15+ and runs natively with SwiftUI.

---
## Screens Walkthrough
Crypt Portfolio
- Shows your portfolio value with toggle between fiat and crypto units.
- Smooth, visually appealing line chart using Catmull-Rom splines.
- Quick-access asset cards displaying Bitcoin and Ethereum info including price and percentage change.
- Recent transactions listed below with timestamps and amounts.

## Exchange

- Modal view for cryptocurrency exchange.
- Editable input fields for ETH and INR amounts.
- Shows current exchange rate, spread, and gas fees.
- Swap button to toggle currency directions.
- “Exchange” button for initiating the swap (logic not yet implemented).

## Record

- Scrollable list of user activities such as meetings, code reviews, deployments.
- Each record presented as a card with icon, title, and date.
- Clean, consistent dark-themed UI with shadows and rounded corners.

## Wallet

- Simple placeholder screen.
- Navigation title included.
- Designed for future expansion with wallet management features.

---

## Known Limitations & Areas for Improvement

- **Static Data:** All portfolio, exchange, and transaction data is hardcoded for demonstration purposes. Needs API integration to fetch real-time data.
- **Wallet Functionality:** Wallet screen is a placeholder and lacks UI and feature implementation.
- **Exchange Logic:** Currently no backend integration or actual currency exchange logic.
- **Accessibility:** VoiceOver, dynamic font scaling, and other accessibility features are not yet supported.
- **Light Mode:** The app supports only dark mode currently; adding light mode would improve usability.
- **Testing:** Basic test scaffolding exists but full unit and UI test coverage is missing.

---

## Contribution

Contributions are welcome! Feel free to:

- Open issues to report bugs or suggest features.
- Submit pull requests to improve functionality or fix issues.



