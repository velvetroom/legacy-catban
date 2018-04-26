import UIKit

class StatsViewCompletionThirdOrder:StatsViewCompletion<StatsViewModelCollectionItemCompletionThirdOrder> {
    override init() {
        super.init()
        self.totalRadians = CircleViewModel.Constants.circleRadians - (CircleViewModel.Constants.interSpace + CircleViewModel.Constants.interSpace)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func render() {
        for circle:CircleViewModel in self.viewModel.circles {
            self.renderCircleWith(viewModel:circle)
        }
    }
}
