// this file holds an enum for expense categories in one place

//------------------Usage definition----------------------------------
// choosing enum for creating a dynamic behavior in future
// using string to automatically assign raw string values to each case
// using CaseIterable to allow iteration over all cases else we had to hardcode and mantain array of categories separately

import Foundation

enum ExpenseCategory: String, CaseIterable {
    case food
    case transport
    case shopping
    case bills
    case entertainment
    case other
}
