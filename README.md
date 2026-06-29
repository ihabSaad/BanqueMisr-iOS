# 🏦 Banque Misr Clone - Advanced iOS Banking App

A secure, high-performance, and scalable iOS Banking Application built with **Swift** and **UIKit**. This project is a complete rewrite from scratch designed to implement modern enterprise architectures, robust user experiences, and advanced iOS concepts.

---

## 🚀 Key Highlights & Architectural Features

*   **Modular Architecture (Multi-Target):** The project is structured into independent local modules (Targets) such as `Core`, `Networking`, and `DesignSystem` to ensure strict separation of concerns, improve compilation speed, and enforce code reusability.
*   **Reactive Programming (RxSwift):** Leveraged **RxSwift** and **RxCocoa** to build a fully reactive data flow, binding the UI seamlessly with underlying Business Logic.
*   **MVVM + Clean Architecture:** Adhered to clean code principles by splitting the codebase into defined layers: **Presentation** (ViewModels/Views), **Domain** (Use Cases/Business Logic), and **Data** (Repositories/Data Sources).
*   **Robust Mock Networking Layer:** Simulates a real-world production backend with a full JSON-based Mock API, handling async network states, loading indicators, and complex edge cases.

---

## 📱 Advanced Features & UX Enhancements

*   **Smart Contact-Based Transfer:** Integrated Apple's **Contacts Framework**. Users can select recipients directly from their device's address book with automated formatting and validation—preventing human typos during transactions.
*   **Two-Way Account Validation:** Upon selecting a phone number, the app performs a smart background validation check via the Mock API to fetch and display the real account owner's name before any money moves (simulating real-time banking security like InstaPay).
*   **Contextual Local Notifications:** Implemented localized transaction receipt notifications. Smartly caches the last transaction's user-written notes and dynamically reminds the user during their next transfer attempt.
*   **Method Swizzling (Global Fonts):** Utilized Objective-C runtime **Method Swizzling** to globally override system fonts across the entire application dynamically, avoiding boilerplate UI configuration code.
*   **Privacy & Data Security:** Implemented a screenshot-blocking mechanism on sensitive screens to safeguard user financial data from unauthorized screen captures.
*   **Modern Design System:** A completely overhauled, slick custom UI built dynamically using XIBs, Auto Layout, and a dedicated tokenized Design System.

---

## 🛠 Tech Stack & Frameworks

*   **Language:** Swift
*   **UI Framework:** UIKit (Custom XIBs & Auto Layout programmatic UI)
*   **Reactive:** RxSwift, RxCocoa
*   **Architecture:** MVVM + Clean Architecture + Multi-Target Modularization
*   **Apple Frameworks:** Contacts Framework, UserNotifications
*   **Advanced:** Objective-C Runtime (Method Swizzling), Application Lifecycle Security

---

## 📂 Project Structure

```text
BanqueMisr-iOS
│
├── Core/               # Core Extensions, Utilities, and Security (Screenshot Blocker)
├── Networking/         # Reusable URLSession wrapper & Mock API Data Handlers
├── DesignSystem/       # Tokenized Colors, Images, and Global Fonts (Swizzling Logic)
├── Domain/             # Business Logic, Interactors, and Use Cases
└── Features/           # MVVM Modules (Authentication, Home, Transfer, History)
