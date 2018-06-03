import Foundation
import Board

class ViewModelListItemFactory {
    class func makeWith(project:ProjectProtocol) -> ViewModelListItem {
        var item:ViewModelListItem = ViewModelListItem()
        item.identifier = project.identifier
        item.name = project.name
        return item
    }
    
    private init() { }
}
