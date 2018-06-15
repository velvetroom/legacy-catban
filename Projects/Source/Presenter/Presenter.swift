import Foundation
import Board
import Shared
import Tools

public class Presenter:NSObject, PresenterProtocol {
    public typealias ViewModel = Projects.ViewModel
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    var selected:Int
    
    public required override init() {
        self.selected = 0
        super.init()
    }
    
    public func didLoad() {
        self.updateViewModel()
    }
    
    func updateViewModel() {
        self.viewModel = ViewModelFactory.makeWith(board:self.interactor.board)
    }
    
    func rename() {
        self.interactor.stateRenameProjectWith(identifier:self.viewModel.items[self.selected].identifier)
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
