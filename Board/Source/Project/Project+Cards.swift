import Foundation

extension Project {
    var countCards:Int {
        get {
            var counter:Int = 0
            self.columns.forEach { (column:ColumnProtocol) in
                counter += column.countCards
            }
            return counter
        }
    }
    
    func add(card:CardProtocol) {
        guard
            let column:ColumnProtocol = self.columns.first
            else { return }
        column.add(card:card)
    }
    
    func remove(card:CardProtocol) {
        for column:ColumnProtocol in self.columns {
            if column.hasCardWith(identifier:card.identifier) {
                column.remove(card:card)
                break
            }
        }
    }
    
    func cardWith(identifier:String) -> CardProtocol {
        var found:CardProtocol!
        for column:ColumnProtocol in self.columns {
            if column.hasCardWith(identifier:identifier) {
                found = column.cardWith(identifier:identifier)
                break
            }
        }
        return found
    }
}
