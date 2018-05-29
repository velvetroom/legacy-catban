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
        self.presenter.outlets.list?.delegate = self.presenter.list
        self.presenter.outlets.list?.dataSource = self.presenter.list
        self.presenter.list.view = self.presenter.outlets.list
    }
    
    private func updateListItems() {
        let items:[ViewModelListItem] = self.listItems()
        self.presenter.list.items = items
        if let selectedIdentifier:String = items.first?.identifier {
            self.presenter.list.selectedIdentifier = selectedIdentifier
        }
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
