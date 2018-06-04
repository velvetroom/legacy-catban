import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Column.View.self
    var deleteType:PresenterDelete.Type
    var outlets:PresenterOutlets
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.outlets = PresenterOutlets()
        self.deleteType = PresenterDelete.self
    }
    
    func presenterDidLoadWith(view:Shared.View) {
        self.configure(view:view)
        self.loadOutlets(view:view)
        self.registerForNotifications()
    }
    
    func shouldUpdate() {
        self.outlets.viewField?.text = self.controller.column.name
    }
    
    func done() {
        self.outlets.viewField?.resignFirstResponder()
        self.updateColumn()
        self.controller.done()
    }
    
    func delete() {
        self.outlets.viewField?.resignFirstResponder()
        let presenter:PresenterDelete = self.deleteType.init()
        presenter.controller = self.controller
        presenter.view = self.outlets.view
        presenter.askConfirmation()
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
    
    private func updateColumn() {
        guard
            let name:String = self.outlets.viewField?.text
        else { return }
        self.controller.column.name = name
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(forName:Notification.Name.UIKeyboardWillChangeFrame, object:nil, queue:OperationQueue.main) { [weak self] (notification:Notification) in
//            self?.keyboardChanged(notification:notification)
        }
    }
}
