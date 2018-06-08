import Foundation

public class PresenterForKeyboardFactory {
    public static func makePresenter() -> PresenterForKeyboardProtocol {
        return PresenterForKeyboard()
    }
}
