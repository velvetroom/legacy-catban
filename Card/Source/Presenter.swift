import Foundation
import Shared
import Tools

public class Presenter:PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    var presenterForKeyboard:PresenterForKeyboardProtocol
    
    public required init() {
        self.presenterForKeyboard = PresenterForKeyboardFactory.makePresenter()
    }
    
    func done() {
//        self.outlets.viewText?.resignFirstResponder()
        self.interactor.done()
    }
    
    func delete() {/*
        self.outlets.viewText?.resignFirstResponder()
        let presenter:PresenterDelete = PresenterDelete()
        presenter.controller = self.controller
        presenter.view = self.outlets.view
        presenter.card = self.controller.card
        presenter.askConfirmation()*/
    }
    
    func update(content:String) {
//        self.controller.update(content:content)
    }
    /*
    func didLoad(view:Shared.View) {
        self.loadOutlets(view:view)
        self.configureController(view:view)
    }
    
    func didAppear(view:Shared.View) {
        self.outlets.viewText?.becomeFirstResponder()
    }*/
    
    public func shouldUpdate() {
//        self.updateViewModel()
    }
    /*
    private func configureController(view:Shared.View) {
        guard
            let view:Card.View = view as? Card.View
        else { return }
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
    }*/
}
