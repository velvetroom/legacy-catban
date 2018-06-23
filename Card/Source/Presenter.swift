import Foundation
import Shared
import Tools

public class Presenter:PresenterProtocol {
    public weak var view:ViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    var keyboardAdjuster:KeyboardAdjusterProtocol
    
    public required init() {
        self.keyboardAdjuster = KeyboardAdjusterFactory.makeAdjuster()
    }
    
    public func didLoad() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.title = self.interactor.card.container!.name
        viewModel.text = self.interactor.card.content
        self.viewModel.update(property:viewModel)
    }
    
    func done() {
        self.interactor.done()
    }
    
    func delete() {
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.name = self.interactor.card.container!.name
        viewModel.title = String.localized(key:"Presenter_Deleter_Title", in:type(of:self))
        let deleter:ViewProtocol = DeleterFactory.makeWith(interactor:self.interactor, and:viewModel)
        self.transition?.present(view:deleter)
    }
    
    func update(content:String) {
        self.interactor.card.content = content
    }
}
