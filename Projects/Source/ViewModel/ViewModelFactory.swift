import Foundation
import Board
import Shared

class ViewModelFactory {
    class func makeListWith(board:BoardProjectsProtocol) -> ViewModelList {
        var viewModel:ViewModelList = ViewModelList()
        viewModel.items = makeSortedItemsWith(board:board)
        return viewModel
    }
    
    class func makeContentWith(board:BoardProjectsProtocol) -> ViewModelContent {
        var viewModel:ViewModelContent = ViewModelContent()
        if board.countProjects > 0 {
            viewModel.emptyHidden = true
            viewModel.selectorHidden = false
            viewModel.listHidden = false
        } else {
            viewModel.emptyHidden = false
            viewModel.selectorHidden = true
            viewModel.listHidden = true
        }
        return viewModel
    }
    
    class func makeNavigationWith(board:BoardProjectsProtocol) -> ViewModelNavigation {
        var viewModel:ViewModelNavigation = ViewModelNavigation()
        if board.countProjects > 0 {
            viewModel.toolbarHidden = false
        }
        return viewModel
    }
    
    private class func makeSortedItemsWith(board:BoardProjectsProtocol) -> [ViewModelListItem] {
        var items:[ViewModelListItem] = makeItemsWith(board:board)
        items.sort { (itemLeft:ViewModelListItem, itemRight:ViewModelListItem) -> Bool in
            let comparison:ComparisonResult = itemLeft.name.compare(
                itemRight.name, options:String.CompareOptions.caseInsensitive)
            return comparison == ComparisonResult.orderedAscending
        }
        return items
    }
    
    private class func makeItemsWith(board:BoardProjectsProtocol) -> [ViewModelListItem] {
        var items:[ViewModelListItem] = []
        board.iterate { (project:ProjectProtocol) in
            var item:ViewModelListItem = ViewModelListItem()
            item.identifier = project.identifier
            item.name = project.name
            items.append(item)
        }
        return items
    }
    
    private init() { }
}
