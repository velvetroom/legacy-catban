import Foundation
@testable import catban

class MockStatsViewCollectionCell:StatsViewCollectionCell {
    var onUpdateWithView:((StatsView) -> Void)?
    
    override func updateWith(view:StatsView) {
        self.onUpdateWithView?(view)
        super.updateWith(view:view)
    }
}
