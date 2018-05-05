import Foundation
import Shared

class Presenter:PresenterProtocol {
    var delegate:PresenterDelegateProtocol!
    lazy var view:Shared.View? = self.factoryView()
    
    init() {
        self.view?.delegate = self
    }
    
    private func factoryView() -> Shared.View? {
        return View()
    }
}
