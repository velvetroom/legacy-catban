import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Card.View.self
    var outlets:PresenterOutlets
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.outlets = PresenterOutlets()
        self.registerForNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func didLoad(view:Shared.View) {
        self.loadOutlets(view:view)
        self.delegate.didLoadPresenter()
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        self.outlets = loader.loadOulets()
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(self.notifiedKeyboardChanged(sender:)),
                                               name:NSNotification.Name.UIKeyboardWillChangeFrame, object:nil)
    }
    
    @objc private func notifiedKeyboardChanged(sender notification:Notification) {
        let keyboard:PresenterKeyboard = PresenterKeyboard()
        keyboard.outlets = self.outlets
        keyboard.notification = notification
        keyboard.adjustOutlets()
    }
}
