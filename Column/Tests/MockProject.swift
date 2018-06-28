import Foundation
import Board

class MockProject:ProjectProtocol {
    var identifier:String
    var created:Int
    var name:String
    var countColumns:Int
    var countCards:Int
    var onRemoveColumn:(() -> Void)?
    
    init() {
        self.identifier = String()
        self.created = 0
        self.name = String()
        self.countColumns = 0
        self.countCards = 0
    }
    
    func orderWith(order:Order) { }
    func copy(project:ProjectProtocol) { }
    func add(column:ColumnProtocol) { }
    func iterate(columns:((ColumnProtocol) -> Void)) { }
    func add(card:CardProtocol) { }
    func remove(card:CardProtocol) { }
    
    func cardWith(identifier:String) -> CardProtocol {
        return CardFactory.newCard()
    }
    
    func columnWith(identifier:String) -> ColumnProtocol {
        return ColumnFactory.newColumn()
    }
    
    func remove(column:ColumnProtocol) {
        self.onRemoveColumn?()
    }
}
