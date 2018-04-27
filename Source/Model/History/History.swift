import Foundation

class History:HistoryProtocol {
    var items:[HistoryItemProtocol]
    
    init() {
        self.items = []
    }
}
