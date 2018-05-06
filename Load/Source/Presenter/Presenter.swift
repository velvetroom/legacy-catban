import Foundation
import Shared

class Presenter:PresenterProtocol {
    var delegate:PresenterDelegateProtocol!

    deinit {
        print("de init presenter")
    }
}
