import UIKit

protocol MapParentProtocol:MapNodeProtocol {
    var childItem:MapItemProtocol? { get set }
}
