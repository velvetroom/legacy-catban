import Foundation
import Board

protocol MapEditorProtocol:class {
    var projectOrder:ProjectOrderProtocol! { get set }
    
    func add(columns:[MapColumnProtocol])
    func arrange(item:MapItemProtocol)
}
