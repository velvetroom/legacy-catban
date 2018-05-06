import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    weak var delegate:PresenterDelegateProtocol?
}
