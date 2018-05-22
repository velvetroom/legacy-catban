import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Column.View.self
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
}
