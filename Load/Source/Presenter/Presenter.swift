import Foundation
import Shared

class Presenter:PresenterProtocol {
    var delegate:PresenterDelegateProtocol!
    lazy weak var view:Shared.View? = View()
    
    init() {
        self.view = View()
        self.view?.delegate = self
    }
    
    deinit {
        print("de init presenter")
    }
}
