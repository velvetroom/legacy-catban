import Foundation
import Shared
import Tools

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Card.View.self
    var deleteType:PresenterDelete.Type
    var outlets:PresenterOutlets
    var presenterForKeyboard:PresenterForKeyboardProtocol
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.outlets = PresenterOutlets()
        self.deleteType = PresenterDelete.self
        self.presenterForKeyboard = PresenterForKeyboardFactory.makePresenter()
    }
    
    func done() {
        self.outlets.viewText?.resignFirstResponder()
        self.controller.done()
    }
    
    func delete() {
        self.outlets.viewText?.resignFirstResponder()
        let presenter:PresenterDelete = self.deleteType.init()
        presenter.controller = self.controller
        presenter.view = self.outlets.view
        presenter.card = self.controller.card
        presenter.askConfirmation()
    }
    
    func update(content:String) {
        self.controller.update(content:content)
    }
    
    func presenterDidLoadWith(view:Shared.View) {
        self.loadOutlets(view:view)
        self.configureController(view:view)
    }
    
    func didAppear(view:Shared.View) {
        self.outlets.viewText?.becomeFirstResponder()
    }
    
    func shouldUpdate() {
        self.updateViewModel()
    }
    
    private func configureController(view:Shared.View) {
        guard
            let view:Card.View = view as? Card.View
        else { return }
        view.presenter = self
        self.outlets.viewText?.delegate = view
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        loader.presenter = self
        self.outlets = loader.loadOulets()
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
}
