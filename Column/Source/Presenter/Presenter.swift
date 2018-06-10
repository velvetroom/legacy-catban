import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public weak var presenting:PresentingViewProtocol!
    public var interactor:Controller!
    var outlets:PresenterOutlets
    
    public required init() {
        self.outlets = PresenterOutlets()
    }
    
//    func didLoad(view:Shared.View) {
//        self.loadOutlets(view:view)
//    }
//
//    func shouldUpdate() {
//        self.outlets.viewField?.text = self.controller.column.name
//    }
    
    func done() {
        self.outlets.viewField?.resignFirstResponder()
        self.updateColumn()
//        self.controller.done()
    }
    
    func delete() {
        self.outlets.viewField?.resignFirstResponder()
        let presenter:PresenterDelete = PresenterDelete()
//        presenter.controller = self.controller
        presenter.view = self.outlets.view
        presenter.askConfirmation()
    }
    /*
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        self.outlets = loader.loadOutlets()
    }*/
    
    private func updateColumn() {
        guard
            let name:String = self.outlets.viewField?.text
        else { return }
//        self.controller.column.name = name
    }
}
