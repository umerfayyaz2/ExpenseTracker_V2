import Foundation

let viewModel = ExpenseViewModel()  // creating instance of ExpenseViewModel
let consoleView = ConsoleView(viewModel: viewModel)  // injecting view model instance to ConsoleView

consoleView.start()  // starting the console app
