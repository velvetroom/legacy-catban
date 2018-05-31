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
            self.createEmpty()
        } else {
            self.createListWith(items:items)
        }
    }
    
    private func loadItems() -> [ViewModelListItem] {
        var items:[ViewModelListItem] = []
        self.board.iterate { (project:ProjectProtocol) in
            let item:ViewModelListItem = ViewModelListItemFactory.makeWith(project:project)
            items.append(item)
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
}
