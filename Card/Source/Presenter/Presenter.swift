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
        if let view:Card.View = view as? Card.View {
            view.controller = self.controller
        }
        self.loadOutlets(view:view)
        self.delegate.didLoadPresenter()
    }
    
    func didAppear(view:Shared.View) {
        self.outlets.viewText?.becomeFirstResponder()
    }
    
    func shouldUpdate() {
        self.updateViewModel()
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
    
    private func updateViewModel() {
        let builder:ViewModelBuilder = ViewModelBuilder()
        builder.card = self.controller.card
        self.updateWith(viewModel:builder.buildViewModel())
    }
    
    private func updateWith(viewModel:ViewModel) {
        self.updateViewWith(viewModel:viewModel.view)
        self.updateTextWith(viewModel:viewModel.text)
    }
    
    private func updateViewWith(viewModel:ViewModelView) {
        self.outlets.view?.title = viewModel.title
    }
    
    private func updateTextWith(viewModel:ViewModelText) {
        self.outlets.viewText?.text = viewModel.content
    }
    
    @objc private func notifiedKeyboardChanged(sender notification:Notification) {
        let keyboard:PresenterKeyboard = PresenterKeyboard()
        keyboard.outlets = self.outlets
        keyboard.notification = notification
        keyboard.adjustOutlets()
    }
}
