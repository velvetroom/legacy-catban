import UIKit

protocol DragParentProtocol:DragObjectProtocol {
    var childItem:DragItemProtocol? { get set }
    var paddingVertical:CGFloat { get }
    var paddingHorizontal:CGFloat { get }
}
