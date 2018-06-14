import Foundation
import Board

class ViewModelFactory {
    class func makeWith(board:BoardProtocol) -> ViewModel {
        var viewModel:ViewModel = ViewModel()
        viewModel.items = makeSortedItemsWith(board:board)
        viewModel.emptyHidden = viewModel.items.isEmpty
        viewModel.listHidden = !viewModel.items.isEmpty
        return viewModel
    }
    
    private class func makeSortedItemsWith(board:BoardProtocol) -> [ViewModelItem] {
        var items:[ViewModelItem] = makeItemsWith(board:board)
        items.sort { (itemLeft:ViewModelItem, itemRight:ViewModelItem) -> Bool in
            let comparison:ComparisonResult = itemLeft.name.compare(
                itemRight.name, options:String.CompareOptions.caseInsensitive)
            return comparison == ComparisonResult.orderedAscending
        }
        return items
    }
    
    private class func makeItemsWith(board:BoardProtocol) -> [ViewModelItem] {
        var items:[ViewModelItem] = []
        board.iterate { (project:ProjectProtocol) in
            var item:ViewModelItem = ViewModelItem()
            item.identifier = project.identifier
            item.name = project.name
            items.append(item)
        }
        return items
    }
    
    private init() { }
}
