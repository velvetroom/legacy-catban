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
        self.configure(view:view)
        self.loadOutlets(view:view)
        self.delegate.didLoadPresenter()
    }
    
    func shouldUpdate() {
        self.outlets.viewField?.text = self.controller.column.name
    }
    
    func done() {
        self.outlets.viewField?.resignFirstResponder()
        self.showNavigationBar()
        self.updateColumn()
        self.controller.done()
    }
    
    func delete() {
        self.outlets.viewField?.resignFirstResponder()
    }
    
    private func configure(view:Shared.View) {
        guard
            let view:Column.View = view as? Column.View
        else { return }
        view.presenter = self
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        self.outlets = loader.loadOutlets()
    }
    
    private func showNavigationBar() {
        self.outlets.view?.navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    private func updateColumn() {
        guard
            let name:String = self.outlets.viewField?.text
        else { return }
        self.controller.column.name = name
    }
}
