import UIKit

extension StatsViewCompletion {
    class func factoryOuterCircle() -> CircleViewModel {
        var viewModel:CircleViewModel = CircleViewModel()
        viewModel.fillColour = UIColor.Shared.gray.cgColor
        viewModel.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
        return viewModel
    }
    
    class func factoryMiddleCircle() -> CircleViewModel {
        var viewModel:CircleViewModel = CircleViewModel()
        viewModel.fillColour = UIColor(white:0, alpha:0.1).cgColor
        viewModel.subtractRadius = CircleViewModel.Constants.subtractRadiusMiddle
        return viewModel
    }
    
    class func factoryInnerCircle() -> CircleViewModel {
        return CircleViewModel()
    }
}
