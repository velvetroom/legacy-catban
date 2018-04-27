import Foundation
@testable import catban

class MockHistoryProtocol:HistoryProtocol {
    var items:[HistoryItemProtocol]
    
    init() {
        self.items = []
    }
}
