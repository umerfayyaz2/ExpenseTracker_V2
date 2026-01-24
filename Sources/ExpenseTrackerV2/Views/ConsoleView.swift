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

        while !shouldExit {
            printMenu()
            let choice = readLine() ?? ""  // if user enters nothing we assign empty string

            switch choice {
            case "1":
                handleAddExpense()
            case "2":
                handleListExpenses()
            case "3":
                handleShowTotal()
            case "0":
                shouldExit = true
            default:
                print("Invalid option ... Please try again")
            }
        }
    }

    // function to print the main menu
    private func printMenu() {
        print("")
        print("===== Expense Tracker =====")
        print("1. Add Expense")
        print("2. List Expenses")
        print("3. Show Total")
        print("0. Exit")
        print("---------------------------")
        print("Enter your choice:")
    }

    // function to handle adding new expense
    private func handleAddExpense() {

        print("Enter expense amount:")
        guard let amountInput = readLine(),
            let amount = Double(amountInput)
        else {
            print("Invalid amount entered. Please try again.")
            return
        }

        print("Select expense category:")
        for (index, category) in ExpenseCategory.allCases.enumerated() {  // iterating through all cases of ExpenseCategory enum for user to select
            print("\(index + 1). \(category.rawValue)")  // displaying index starting from 1
        }

        guard let categoryInput = readLine(),  // reading user input for category
            let categoryIndex = Int(categoryInput),  // converting to Int because readLine returns String
            categoryIndex > 0,
            categoryIndex <= ExpenseCategory.allCases.count
        else {  // validating index is within range
            print("Invalid category selected. Please try again.")
            return
        }

        let selectedCategory = ExpenseCategory.allCases[categoryIndex - 1]  // getting the selected category from enum cases array - adjusting for 0 based index

        print("Enter note for expense(optional):")
        let noteInput = readLine()
        let note = noteInput?.isEmpty == true ? nil : noteInput

        let success = viewModel.addExpense(
            amount: amount,
            category: selectedCategory,
            note: note
        )  // delegating to view model to add expense

        if success {
            print("Expense added successfully.")
        } else {
            print("Failed to add expense. Amount must be greater than zero - check inputs.")
        }
    }

    // function to handle listing all expenses
    private func handleListExpenses() {
        let expenses = viewModel.getAllExpenses()  // getting all expenses from the view model

        print("----- All Expenses -----")

        if expenses.isEmpty {
            print("No expenses recorded yet.")
            return
        }

        // iterating through all expenses and displaying them
        for (index, expense) in expenses.enumerated() {  // enumerated to show index
            print("\(index + 1).")
            print("Amount: \(expense.amount)")
            print("Category: \(expense.category.rawValue)")
            print("Note: \(expense.note ?? "N/A")")
            print("Date: \(expense.date)")
            print("-------------------")
        }
    }

    // displaying total expenses at the end
    private func handleShowTotal() {
        let total = viewModel.getTotalExpense()
        print("Total Expense Amount: \(total)")
    }
}
