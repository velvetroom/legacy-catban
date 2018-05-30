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
            items.append(self.createItemWith(project:project))
        }
        var item:ViewModelListItem = ViewModelListItem()
        item.name = "Abc"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "JjkgGL"
        items.append(item)
        item.name = "0131312"
        items.append(item)
        item.name = "0131312"
        items.append(item)
        item.name = "0131312"
        items.append(item)
        item.name = "0131312"
        items.append(item)
        item.name = "Abc"
        items.append(item)
        item.name = "Abc"
        items.append(item)
        item.name = "Abc"
        items.append(item)
        item.name = "Abc"
        items.append(item)
        item.name = "Abc"
        items.append(item)
        item.name = "Abc"
        items.append(item)
        item.name = "Abc"
        items.append(item)
        item.name = "Abc"
        items.append(item)
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
