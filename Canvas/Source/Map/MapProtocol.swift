import Foundation

protocol MapProtocol:class {
    var viewScroll:View! { get set }
    
    func add(column:MapColumn)
    func add(item:MapItemProtocol)
    func updateContentSize()
    func clear()
}
