import Foundation
import CleanArchitecture
import Board
import Architecture
import Tools

public class Presenter:NSObject, PresenterProtocol {
    public weak var view:ViewProtocol?
    public weak var transition:TransitionProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    var state:PresenterState
    
    public required override init() {
        self.state = PresenterState()
        super.init()
    }
    
    public func willAppear() {
        self.shouldUpdate()
    }
    
    public func shouldUpdate() {
        let navigation:ViewModelNavigation = ViewModelFactory.makeNavigationWith(board:self.interactor.board)
        let content:ViewModelContent = ViewModelFactory.makeContentWith(board:self.interactor.board)
        let list:ViewModelList = ViewModelFactory.makeListWith(board:self.interactor.board)
        self.viewModel.update(property:navigation)
        self.viewModel.update(property:content)
        self.viewModel.update(property:list)
        self.selectCurrentItem()
    }
    
    func identifierFor(indexPath:IndexPath) -> String {
        let viewModel:ViewModelList = self.viewModel.property()
        return viewModel.items[indexPath.item].identifier
    }
    
    func rename() {
        guard
            let selected:String = self.state.selected
        else { return }
        self.interactor.stateRenameProjectWith(identifier:selected)
        self.interactor.openNamer()
    }
    
    func openProject() {
        guard
            let selected:String = self.state.selected
        else { return }
        self.interactor.openProjectWith(identifier:selected)
    }
    
    func openScanner() {
        let presenter:PresenterScan = PresenterScan()
        let view:ViewScan = ViewScan(presenter:presenter)
        view.presenter.interactor = self.interactor
        self.transition?.presentAnimated(view:view, completion:nil)
    }
    
    func openProjectCloud() {
        guard
            let selected:String = self.state.selected
        else { return }
        self.interactor.openProjectCloudWith(identifier:selected)
    }
    
    func addProject() {
        self.interactor.stateAddProject()
        self.interactor.openNamer()
    }
    
    func delete() {
        guard
            let selected:String = self.state.selected
        else { return }
        self.interactor.stateDeleteProjectWith(identifier:selected)
        self.interactor.openDeleter()
    }
}
