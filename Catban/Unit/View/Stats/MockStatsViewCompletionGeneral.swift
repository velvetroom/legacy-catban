import Foundation
@testable import catban

class MockStatsViewCompletionGeneral:StatsViewCompletionGeneral {
    var onUpdateWithViewModel:((CircleViewModelCompletion) -> Void)?
    
    override func updateWith(viewModel:CircleViewModelCompletion) {
        self.onUpdateWithViewModel?(viewModel)
    }
}
