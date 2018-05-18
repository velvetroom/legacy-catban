import Foundation
import Board

protocol PresenterColumnProtocol {
    var mapEditor:MapEditorProtocol! { get set }
    var view:View! { get set }
    var column:ColumnProtocol! { get set }
    var first:Bool { get set }
    
    init()
    func load()
}
