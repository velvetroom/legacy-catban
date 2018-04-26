import UIKit

extension StatsViewCompletion {
    class func factoryBaseCircles() -> [CircleViewModel] {
        return [
            factoryOuterCircle(),
            factoryMiddleCircle(),
            factoryInnerCircle()]
    }
    
    class func factoryOuterCircle() -> CircleViewModel {
        var viewModel:CircleViewModel = CircleViewModel()
        viewModel.fillColour = UIColor.Shared.gray.cgColor
        viewModel.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
        return viewModel
    }
    
    class func factoryMiddleCircle() -> CircleViewModel {
        var viewModel:CircleViewModel = CircleViewModel()
        viewModel.fillColour = UIColor.Shared.blue.withAlphaComponent(0.2).cgColor
        viewModel.subtractRadius = CircleViewModel.Constants.subtractRadiusMiddle
        return viewModel
    }
    
    class func factoryInnerCircle() -> CircleViewModel {
        return CircleViewModel()
    }
}
