import UIKit

class StatsViewCompletionThirdOrder:StatsViewCompletion<StatsViewModelCollectionItemCompletionThirdOrder> {
    override func render() {
        self.moveToCentre()
        for circle:StatsViewModelCollectionItemCompletionCircle in self.viewModel.circles {
            self.renderCircleWith(viewModel:circle)
        }
    }
}
