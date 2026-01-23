// this file will handle all the view model logic for expenses
// this will act as a bridge between the model and the views

import Foundation

final class ExpenseViewModel {
    // this variable will hold all the expenses array during app
    // intentionally kept private to avoid direct modification from outside
    private var expenses: [Expense] = []  // using Expense model defined in Expense.swift

    // function to add a new expense and validate inputs
    func addExpense(amount: Double, category: ExpenseCategory, note: String?) -> Bool {

        // basic guard validation goes here - amount must be greater than zero
        guard amount > 0 else {
            return false
        }

        let newExpense = Expense(amount: amount, category: category, note: note, date: Date())

        expenses.append(newExpense)  // adding new expense to expenses array
        return true
    }
    // function to return all stored expenses through expense array
    func getAllExpenses() -> [Expense] {
        return expenses
    }

    // total expense calculation function
    func getTotalExpense() -> Double {
        var total: Double = 0.0  // this will hold the total expenses

        for expense in expenses {
            total += expense.amount
        }

        return total  // returning the total calculated amount
    }

}
