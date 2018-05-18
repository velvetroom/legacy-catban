import Foundation

class Presenter:PresenterProtocol {
    var view:View
    
    init() {
        self.view = View()
    }
}
