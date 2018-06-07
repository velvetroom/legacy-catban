import Foundation

class PresenterViewUpdater {
    var viewModel:ViewModelProtocol!
    weak var presenter:Presenter!
    
    func update() {
        self.updateList()
        self.updateListItems()
        self.updateEmpty()
        self.updateToolbar()
    }
    
    private func updateList() {
        self.presenter.outlets.list?.isHidden = self.viewModel.listHidden
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
    
    private func updateToolbar() {
        self.presenter.outlets.view?.navigationController?.setToolbarHidden(
            self.viewModel.toolbarHidden, animated:true)
    }
    
    private func listItems() -> [ViewModelListItem] {
        guard
            let viewModel:ViewModelList = self.viewModel as? ViewModelList
        else { return [] }
        return viewModel.items
    }
}
