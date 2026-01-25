/// Utility responsible for clearing the console screen.
/// This is UI-related behavior and should only be called from Views.
import Foundation

struct ClearScreen {

    static func clear() {
        #if os(Windows)
            _ = system("cls")
        #else
            _ = system("clear")
        #endif
    }
}
