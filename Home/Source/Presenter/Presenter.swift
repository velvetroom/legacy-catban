import Foundation
import Shared

class Presenter:PresenterProtocol {
    var view:View
    
    init() {
        self.view = View()
        self.view.delegate = self
    }
}
