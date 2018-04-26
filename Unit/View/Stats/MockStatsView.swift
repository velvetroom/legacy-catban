import Foundation
@testable import catban

class MockStatsView:StatsView<MockStatsViewModelCollectionItemProtocol> {
    var onRemoveFromSuperview:(() -> Void)?
    
    override func removeFromSuperview() {
        self.onRemoveFromSuperview?()
        super.removeFromSuperview()
    }
}
