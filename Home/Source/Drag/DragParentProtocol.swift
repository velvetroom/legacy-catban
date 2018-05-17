import UIKit

protocol DragParentProtocol:DragObjectProtocol {
    var childItem:DragItemProtocol? { get set }
}
