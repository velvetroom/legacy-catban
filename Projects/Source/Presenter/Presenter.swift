import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Projects.View.self
    weak var delegate:PresenterDelegateProtocol!
    weak var controller:Controller!
}
