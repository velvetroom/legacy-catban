import UIKit

extension StatsViewCompletion {
    class func factoryWith(viewModel:CircleCompletionViewModel) -> StatsViewCompletion {
        let view:StatsViewCompletion = StatsViewCompletion()
        view.viewGeneral.updateWith(viewModel:viewModel)
        view.viewModel.circles = factoryCirclesWith(viewModel:viewModel)
        return view
    }
    
    private class func factoryCirclesWith(viewModel:CircleCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = factoryWithBacklogFor(viewModel:viewModel)
        circles = factoryWithProgressFor(viewModel:viewModel, and:circles)
        circles = factoryWithDoneFor(viewModel:viewModel, and:circles)
        circles.append(factoryMiddleCircle())
        circles.append(factoryInnerCircle())
        return circles
    }
    
    private class func factoryWithBacklogFor(viewModel:CircleCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = []
        if viewModel.backlog.cards > 0 {
            circles.append(factoryBacklogCircleWith(viewModel:viewModel))
        }
        return circles
    }
    
    private class func factoryWithProgressFor(viewModel:CircleCompletionViewModel,
                                              and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if viewModel.progress.cards > 0 {
            circles.append(factoryProgressCircleWith(viewModel:viewModel))
        }
        return circles
    }
    
    private class func factoryWithDoneFor(viewModel:CircleCompletionViewModel,
                                          and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if viewModel.done.cards > 0 {
            circles.append(factoryDoneCircleWith(viewModel:viewModel))
        }
        return circles
    }
    
    private class func factoryMiddleCircle() -> CircleViewModel {
        var viewModel:CircleViewModel = CircleViewModel()
        viewModel.fillColour = UIColor(white:0, alpha:0.1).cgColor
        viewModel.subtractRadius = CircleViewModel.Constants.subtractRadiusMiddle
        return viewModel
    }
    
    private class func factoryInnerCircle() -> CircleViewModel {
        return CircleViewModel()
    }
}
