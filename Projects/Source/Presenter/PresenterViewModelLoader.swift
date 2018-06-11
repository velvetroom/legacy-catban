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
        var items:[ViewModelListItem] = self.itemsFromBoard()
        items.sort { (itemLeft:ViewModelListItem, itemRight:ViewModelListItem) -> Bool in
            let comparison:ComparisonResult = itemLeft.name.compare(
                itemRight.name, options:String.CompareOptions.caseInsensitive)
            return comparison == ComparisonResult.orderedAscending
        }
        return items
    }
    
    private func itemsFromBoard() -> [ViewModelListItem] {
        var items:[ViewModelListItem] = []
        self.board.iterate { (project:ProjectProtocol) in
            var item:ViewModelListItem = ViewModelListItem()
            item.identifier = project.identifier
            item.name = project.name
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
