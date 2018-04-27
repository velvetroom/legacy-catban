import UIKit

extension StatsViewCompletion {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.blue.cgColor
            circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    class func factoryDoneCircleWith(viewModel:CircleCompletionViewModel) -> CircleViewModel {
        let radians:CGFloat = viewModel.done.radians - CircleViewModel.Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.startAngle = CircleViewModel.Constants.startAngle + viewModel.backlog.radians
            + viewModel.progress.radians
        circle.endAngle = circle.startAngle + radians
        return circle
    }
}
