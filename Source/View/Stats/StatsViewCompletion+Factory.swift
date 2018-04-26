import UIKit

extension StatsViewCompletion {
    class func factoryOuterCircle() -> StatsViewModelCollectionItemCompletionCircle {
        var viewModel:StatsViewModelCollectionItemCompletionCircle =
            StatsViewModelCollectionItemCompletionCircle()
        viewModel.fillColour = UIColor.Shared.gray.cgColor
        viewModel.startAngle = StatsViewCompletionConstants.startAngle
        viewModel.endAngle = StatsViewCompletionConstants.endAngle
        viewModel.radius = .getMiddleCircleRadius as ((StatsViewCompletionProtocol) -> () -> (CGFloat))
        return viewModel
    }
    
    class func factoryMiddleCircle() -> StatsViewModelCollectionItemCompletionCircle {
        var viewModel:StatsViewModelCollectionItemCompletionCircle =
            StatsViewModelCollectionItemCompletionCircle()
        viewModel.fillColour = UIColor.Shared.blue.withAlphaComponent(0.2).cgColor
        viewModel.startAngle = StatsViewCompletionConstants.startAngle
        viewModel.endAngle = StatsViewCompletionConstants.endAngle
        return viewModel
    }
    
    class func factoryInnerCircle() -> StatsViewModelCollectionItemCompletionCircle {
        var viewModel:StatsViewModelCollectionItemCompletionCircle =
            StatsViewModelCollectionItemCompletionCircle()
        viewModel.fillColour = UIColor.white.cgColor
        viewModel.startAngle = StatsViewCompletionConstants.startAngle
        viewModel.endAngle = StatsViewCompletionConstants.endAngle
        return viewModel
    }
}
