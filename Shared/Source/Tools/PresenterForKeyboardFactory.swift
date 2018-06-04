import Foundation

public class PresenterForKeyboardFactory {
    static func makePresenter() -> PresenterForKeyboardProtocol {
        return PresenterForKeyboard()
    }
}
