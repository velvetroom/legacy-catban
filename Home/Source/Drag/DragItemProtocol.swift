import UIKit

protocol DragItemProtocol:DragObjectProtocol {
    var parent:DragParentProtocol! { get set }
}
