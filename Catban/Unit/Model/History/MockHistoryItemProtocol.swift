import Foundation
@testable import catban

class MockHistoryItemProtocol:HistoryItemProtocol {
    var created:Int
    
    init() {
        self.created = MockHistoryItemProtocol.currentTimestamp()
    }
}
