// this file will act as user inerface for console based interaction with this app
// it will handle all i/o operations with user and delegate business logic to view model all logic to the ExpenseViewModel.swift

import Foundation

final class ConsoleView {

    private let viewModel: ExpenseViewModel  // using ExpenseViewModel view model as reference and adding it's dependency here - not creating a new instance here

    init(viewModel: ExpenseViewModel) {
        self.viewModel = viewModel  // this will initialize the viewModel that will be created in main.swift and passed here i.e injecting ViewModel created in main.swift to this ConsoleView
    }

    // function to start the console app
    func start() {
        var shouldExit = false

        ClearScreen.clear()  // clear screen when app starts

        while !shouldExit {
            printMenu()
            print("Enter your choice: ", terminator: "")
            let choice = readLine() ?? ""

            switch choice {
            case "1":
                ClearScreen.clear()
                handleAddExpense()
            case "2":
                ClearScreen.clear()
                handleListExpenses()
            case "3":
                ClearScreen.clear()
                handleShowTotal()
            case "0":
                shouldExit = true
            default:
                print("Invalid option. Please try again.")
            }

            if !shouldExit {
                print("\nPress Enter to return to main menu...", terminator: "")
                _ = readLine()
                ClearScreen.clear()
            }
        }
    }

    // function to print the main menu
    private func printMenu() {
        print("")
        print("================================")
        print("        EXPENSE TRACKER         ")
        print("================================")
        print("1. Add Expense")
        print("2. List Expenses")
        print("3. Show Total Expenses")
        print("0. Exit")
        print("================================")
    }

    // function to handle adding new expense
    private func handleAddExpense() {

        print("Enter expense amount: ", terminator: "")
        guard let amountInput = readLine(),
            let amount = Double(amountInput)
        else {
            print("Invalid amount entered.")
            return
        }

        print("\nSelect expense category:")
        for (index, category) in ExpenseCategory.allCases.enumerated() {
            print("\(index + 1). \(category.rawValue)")
        }
        print("0. Back to Main Menu")

        print("Your choice: ", terminator: "")
        guard let categoryInput = readLine(),
            let categoryIndex = Int(categoryInput)
        else {
            print("Invalid input.")
            return
        }

        if categoryIndex == 0 { return }

        guard categoryIndex > 0,
            categoryIndex <= ExpenseCategory.allCases.count
        else {
            print("Invalid category selected.")
            return
        }

        let selectedCategory = ExpenseCategory.allCases[categoryIndex - 1]

        print("Enter note (optional): ", terminator: "")
        let noteInput = readLine()
        let note = noteInput?.isEmpty == true ? nil : noteInput

        let success = viewModel.addExpense(
            amount: amount,
            category: selectedCategory,
            note: note
        )

        if success {
            print("Expense added successfully.")
        } else {
            print("Failed to add expense.")
        }
    }

    // function to handle listing all expenses
    private func handleListExpenses() {
        let expenses = viewModel.getAllExpenses()

        print("\n========= ALL EXPENSES =========")

        if expenses.isEmpty {
            print("No expenses recorded yet.")
            return
        }

        for (index, expense) in expenses.enumerated() {
            print("\n\(index + 1).")
            print("Amount   : \(expense.amount)")
            print("Category : \(expense.category.rawValue)")
            print("Note     : \(expense.note ?? "N/A")")
            print("Date     : \(expense.date)")
            print("--------------------------------")
        }

        print("0. Back to Main Menu")
        print("Enter choice: ", terminator: "")
        _ = readLine()
    }

    // displaying total expenses at the end
    private func handleShowTotal() {
        let total = viewModel.getTotalExpense()
        print("\nTotal Expense Amount: \(total)")
        print("0. Back to Main Menu")
        print("Enter choice: ", terminator: "")
        _ = readLine()
    }
}
