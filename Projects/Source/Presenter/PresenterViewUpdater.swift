import Foundation

class PresenterViewUpdater {
    var viewModel:ViewModelProtocol!
    var outlets:PresenterOutlets!
    
    func update() {
        self.updateList()
        self.updateEmpty()
        self.updateMenu()
    }
    
    private func updateList() {
        self.outlets.list?.isHidden = self.viewModel.listHidden
        self.outlets.list?.presenter.items = self.listItems()
    }
    
    private func updateEmpty() {
        self.outlets.empty?.isHidden = self.viewModel.emptyHidden
    }
    
    private func updateMenu() {
        self.outlets.menu?.isUserInteractionEnabled = self.viewModel.menuEnabled
        self.outlets.menu?.alpha = self.viewModel.menuAlpha
    }
    
    private func listItems() -> [ViewModelListItem] {
        guard
            let viewModel:ViewModelList = self.viewModel as? ViewModelList
        else { return [] }
        return viewModel.items
    }
}
