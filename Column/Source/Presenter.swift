import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    
    public required init() { }
    
//    func didLoad(view:Shared.View) {
//        self.loadOutlets(view:view)
//    }
//
//    func shouldUpdate() {
//        self.outlets.viewField?.text = self.controller.column.name
//    }
    
    func done() {
//        self.outlets.viewField?.resignFirstResponder()
        self.updateColumn()
//        self.controller.done()
    }
    
    func delete() {
    }
    
    private func updateColumn() {
//        guard
//            let name:String = self.outlets.viewField?.text
//        else { return }
//        self.controller.column.name = name
    }
}
