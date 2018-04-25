import Foundation
@testable import catban

class MockStatsViewCollectionCell:StatsViewCollectionCell {
    var onUpdateWithViewModel:((StatsViewModelCollectionItemProtocol) -> Void)?
    
    override func updateWith(viewModel:StatsViewModelCollectionItemProtocol) {
        self.onUpdateWithViewModel?(viewModel)
        super.updateWith(viewModel:viewModel)
    }
}
