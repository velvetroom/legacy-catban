import Foundation
import Board

class PresenterViewModelLoader {
    weak var board:BoardProjectsProtocol!
    var viewModel:ViewModelProtocol
    
    init() {
        self.viewModel = ViewModelEmpty()
    }
    
    func load() {
        let items:[ViewModelListItem] = self.loadItems()
        if items.isEmpty {
            self.createListWith(items:items)
        } else {
            self.createEmpty()
        }
    }
    
    private func loadItems() -> [ViewModelListItem] {
        var items:[ViewModelListItem] = []
        self.board.iterate { (project:ProjectProtocol) in
            items.append(self.createItemWith(project:project))
        }
        return items
    }
    
    private func createListWith(items:[ViewModelListItem]) {
        var viewModel:ViewModelList = ViewModelList()
        viewModel.items = items
        self.viewModel = viewModel
    }
    
    private func createEmpty() {
        self.viewModel = ViewModelEmpty()
    }
    
    private func createItemWith(project:ProjectProtocol) -> ViewModelListItem {
        var item:ViewModelListItem = ViewModelListItem()
        item.identifier = project.identifier
        item.name = project.name
        return item
    }
}
