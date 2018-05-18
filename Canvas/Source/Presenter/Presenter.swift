import Foundation
import Board

class Presenter:PresenterProtocol {
    weak var project:ProjectProtocol!
    var view:View
    var builder:ViewModelBuilderProtocol
    
    init() {
        self.view = View()
        self.builder = ViewModelBuilder()
    }
    
    func refresh() {
        
    }
}
