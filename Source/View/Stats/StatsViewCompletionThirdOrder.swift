import UIKit

class StatsViewCompletionThirdOrder:StatsViewCompletion<StatsViewModelCollectionItemCompletionThirdOrder> {
    override func render() {
        self.moveToCentre()
        for circle:CircleViewModel in self.viewModel.circles {
            self.renderCircleWith(viewModel:circle)
        }
    }
}
