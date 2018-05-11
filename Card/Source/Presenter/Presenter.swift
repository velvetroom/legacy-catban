import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Card.View.self
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
}
