import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = View.self
    weak var delegate:PresenterDelegateProtocol!
}
