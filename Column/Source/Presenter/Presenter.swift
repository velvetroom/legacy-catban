import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Column.View.self
    var outlets:PresenterOutlets
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func didLoad(view:Shared.View) {
        self.loadOutlets(view:view)
        self.delegate.didLoadPresenter()
    }
    
    func shouldUpdate() {
        self.outlets.viewField?.text = self.controller.column.name
    }
    
    func done() {
        self.outlets.viewField?.resignFirstResponder()
    }
    
    func delete() {
        self.outlets.viewField?.resignFirstResponder()
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        self.outlets = loader.loadOutlets()
    }
}
