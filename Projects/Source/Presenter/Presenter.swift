import Foundation
import Board
import Shared
import Tools

public class Presenter:NSObject, PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    var selected:Int
    
    public required override init() {
        self.selected = 0
        super.init()
    }
    
    public func didLoad() {
        self.shouldUpdate()
    }
    
    public func shouldUpdate() {
        let navigation:ViewModelNavigation = ViewModelFactory.makeNavigationWith(board:self.interactor.board)
        let content:ViewModelContent = ViewModelFactory.makeContentWith(board:self.interactor.board)
        let list:ViewModelList = ViewModelFactory.makeListWith(board:self.interactor.board)
        self.viewModel.update(property:navigation)
        self.viewModel.update(property:content)
        self.viewModel.update(property:list)
    }
    
    func rename() {
        let viewModel:ViewModelList = self.viewModel.property()
        self.interactor.stateRenameProjectWith(identifier:viewModel.items[self.selected].identifier)
        self.interactor.openNamer()
    }
    
    func delete() {
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.itemType = String.localized(key:"Presenter_DeleteritemType", in:type(of:self))
//        viewModel.name = self.interactor.state
        let view:PresentingViewProtocol = DeleterFactory.makeWith(interactor:self.interactor, and:viewModel)
        self.transition?.present(view:view)
    }
}
