import Foundation

protocol MapCardProtocol:MapItemProtocol, MapParentProtocol {
    var identifier:String { get set }
}
