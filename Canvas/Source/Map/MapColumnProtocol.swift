import UIKit

protocol MapColumnProtocol:MapParentProtocol {
    var height:CGFloat { get }
    
    func add(item:MapItemProtocol)
    func append(item:MapItemProtocol)
}
