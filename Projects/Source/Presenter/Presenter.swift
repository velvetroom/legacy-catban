import Foundation
import Board
import Shared
import Tools

public class Presenter:NSObject, PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    var state:PresenterState
    
    public required override init() {
        self.state = PresenterState()
        super.init()
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
    
    func addProject() {
        self.interactor.stateAddProject()
        self.interactor.openNamer()
    }
    
    func delete() {
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.itemType = String.localized(key:"Presenter_DeleteritemType", in:type(of:self))
//        viewModel.name = self.interactor.state
        let view:PresentingViewProtocol = DeleterFactory.makeWith(interactor:self.interactor, and:viewModel)
        self.transition?.present(view:view)
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
    
    private func selectCurrentItem() {
        let viewModel:ViewModelList = self.viewModel.property()
        guard
            viewModel.items.isEmpty == false
        else { return }
        var index:Int = 0
        if let identifier:String = self.state.selected {
            let countItems:Int = viewModel.items.count
            for indexItem:Int in 0 ..< countItems {
                if viewModel.items[indexItem].identifier == identifier {
                    index = indexItem
                    break
                }
            }
        }
        self.selectItemAt(index:index)
    }
    
    private func selectItemAt(index:Int) {
        var viewModel:ViewModelSelected = ViewModelSelected()
        viewModel.indexPath = IndexPath(item:index, section:0)
        self.viewModel.update(property:viewModel)
    }
}
