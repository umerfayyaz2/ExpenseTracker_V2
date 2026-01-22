// This file will hold the expense model definiton for each expense record
// this model will store and hold our expense data

import Foundation

struct Expense {
    let amount: Double
    let category: ExpenseCategory  // using enum defined in ExpenseCategory.swift
    let note: String?
    let date: Date
}
