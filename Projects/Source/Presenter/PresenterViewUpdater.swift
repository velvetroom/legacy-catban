import Foundation

class PresenterViewUpdater {
    var viewModel:ViewModelProtocol!
    weak var presenter:Presenter!
    
    func update() {
        self.updateList()
        self.updateListItems()
        self.updateEmpty()
        self.updateMenu()
    }
    
    private func updateList() {
        self.presenter.outlets.list?.isHidden = self.viewModel.listHidden
        self.presenter.outlets.selector?.isHidden = self.viewModel.selectorHidden
    }
    
    private func updateListItems() {
        let items:[ViewModelListItem] = self.listItems()
        self.presenter.list.items = items
        self.presenter.list.view.reloadData()
        self.presenter.list.selectFirstItem()
    }
    
    private func updateEmpty() {
        self.presenter.outlets.empty?.isHidden = self.viewModel.emptyHidden
    }
    
    private func updateMenu() {
        self.presenter.outlets.menu?.isUserInteractionEnabled = self.viewModel.menuEnabled
        self.presenter.outlets.menu?.alpha = self.viewModel.menuAlpha
    }
    
    private func listItems() -> [ViewModelListItem] {
        guard
            let viewModel:ViewModelList = self.viewModel as? ViewModelList
        else { return [] }
        return viewModel.items
    }
}
