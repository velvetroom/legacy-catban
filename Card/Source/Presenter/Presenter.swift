import Foundation
import Shared

class Presenter:PresenterProtocol {
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
}
