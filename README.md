# Expense Tracker v2.0 — Console MVVM (Swift)

A **console-based Expense Tracker** implemented in **Swift** to demonstrate **MVVM architecture**, **data ownership**, and **separation of concerns**.  
UI complexity is intentionally avoided to keep the focus on **architecture and logic**.

---

## Objective

- Implement MVVM correctly
- Enforce strict responsibility boundaries
- Demonstrate clear data flow
- Build an explainable, interview-ready project

This project is **architecture-driven**, not feature-driven.

---

## Architecture

The project follows **MVVM (Model–View–ViewModel)**.

### Model
- Defines data structures only
- Contains no logic or validation

### ViewModel
- Owns all application data
- Implements all business rules
- Acts as the single source of truth

### View (Console)
- Handles input/output only
- Delegates all logic to the ViewModel
- Does not store or manipulate data

### Utils
- Contains UI-specific helpers only
- No business logic


## Folder Structure

```text
ExpenseTrackerV2/
├── Models/
│   ├── Expense.swift
│   └── ExpenseCategory.swift
│
├── ViewModels/
│   └── ExpenseViewModel.swift
│
├── Views/
│   └── ConsoleView.swift
│
├── Utils/
│   └── ClearScreen.swift
│
├── main.swift
└── README.md

```
---

## Data Flow

### Add Expense Flow

1. User selects an option in the console
2. ConsoleView collects raw input
3. ConsoleView calls ViewModel methods
4. ViewModel:
   - Validates data
   - Creates model objects
   - Updates internal state
5. ConsoleView displays the result

No logic exists outside the ViewModel.

---

## Key Design Decisions

### Console as View
- Eliminates UI framework dependency
- Keeps architecture easy to trace
- Improves explainability

### In-Memory Data Storage
- ViewModel owns data intentionally
- Persistence abstraction is deferred
- Architecture remains extensible

### ClearScreen Utility
- Screen clearing is a UI concern
- Implemented as a reusable utility
- Used only by the View layer

---

## Features

- Add expenses
- Categorize expenses
- Optional notes per expense
- List all expenses
- Calculate total expenses
- Clean console navigation
- Back-to-menu option on every screen

---

## Build & Run

### Requirements
- Swift 5+
- Swift CLI
- macOS, Linux, or Windows

### Commands

```bash
swift build
swift run
```

## Scope Limitation

This project intentionally excludes:

- UI frameworks (SwiftUI / UIKit)
- Persistent storage
- Networking
- Advanced error handling

The focus is **correct architecture**, not production features.

---

## Future Extensions

- Persistent storage (file / database)
- Filtering and reporting
- SwiftUI frontend using the same ViewModel
- Export functionality

---

## Author

**Umer Fayyaz Basra**  
BS Information Technology  
Focused on software fundamentals and clean architecture.
