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
        self.interactor.update(content:content)
    }
}
