import Foundation
import Shared

class Presenter:PresenterProtocol {
    var delegate:PresenterDelegateProtocol!
    var view:Shared.View
    
    init() {
        self.view = View()
        self.view.delegate = self
    }
}
