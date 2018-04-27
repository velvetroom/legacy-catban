import UIKit

extension StatsViewCompletion {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.blue.withAlphaComponent(0.3).cgColor
            circleOuter.subtractRadius = CircleViewModel.Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    class func factoryProgressCircleWith(viewModel:CircleCompletionViewModel) -> CircleViewModel {
        let radians:CGFloat = viewModel.progress.radians - CircleViewModel.Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.startAngle = CircleViewModel.Constants.startAngle + viewModel.backlog.radians
        circle.endAngle = circle.startAngle + radians
        return circle
    }
}
