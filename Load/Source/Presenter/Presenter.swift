import Foundation
import Shared

class Presenter:PresenterProtocol {
    var delegate:PresenterDelegateProtocol!
    weak var view:View?
    
    init() {
        self.view?.delegate = self
    }
    
    deinit {
        print("de init presenter")
    }
    
    func presentView() -> Shared.View {
        let view:View = View()
        self.view = view
        return view
    }
}
