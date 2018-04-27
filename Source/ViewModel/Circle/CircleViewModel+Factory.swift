import UIKit

extension CircleViewModel {
    static func factoryWith(viewModel:CircleCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = factoryWithBacklogFor(viewModel:viewModel)
        circles = factoryWithProgressFor(viewModel:viewModel, and:circles)
        circles = factoryWithDoneFor(viewModel:viewModel, and:circles)
        circles = factoryBaseFor(circles:circles)
        return circles
    }
    
    private static func factoryWithBacklogFor(viewModel:CircleCompletionViewModel) -> [CircleViewModel] {
        var circles:[CircleViewModel] = []
        if viewModel.backlog.cards > 0 {
            let circle:CircleViewModel = factoryBacklogCircleWith(viewModel:viewModel)
            circles.append(circle)
        }
        return circles
    }
    
    private static func factoryWithProgressFor(viewModel:CircleCompletionViewModel,
                                              and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if viewModel.progress.cards > 0 {
            let circle:CircleViewModel = factoryProgressCircleWith(viewModel:viewModel)
            circles.append(circle)
        }
        return circles
    }
    
    private static func factoryWithDoneFor(viewModel:CircleCompletionViewModel,
                                          and circles:[CircleViewModel]) -> [CircleViewModel] {
        var circles:[CircleViewModel] = circles
        if viewModel.done.cards > 0 {
            let circle:CircleViewModel = factoryDoneCircleWith(viewModel:viewModel)
            circles.append(circle)
        }
        return circles
    }
    
    private static func factoryBaseFor(circles:[CircleViewModel]) -> [CircleViewModel] {
        let middleCircle:CircleViewModel = factoryMiddleCircle()
        let innerCircle:CircleViewModel = factoryInnerCircle()
        var circles:[CircleViewModel] = circles
        circles.append(middleCircle)
        circles.append(innerCircle)
        return circles
    }
    
    private static func factoryMiddleCircle() -> CircleViewModel {
        var viewModel:CircleViewModel = CircleViewModel()
        viewModel.fillColour = UIColor(white:0, alpha:0.1).cgColor
        viewModel.subtractRadius = CircleViewModel.Constants.subtractRadiusMiddle
        return viewModel
    }
    
    private static func factoryInnerCircle() -> CircleViewModel {
        return CircleViewModel()
    }
}
