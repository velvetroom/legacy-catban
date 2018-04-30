import UIKit

extension CircleViewModel {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.blue.withAlphaComponent(0.3).cgColor
            circleOuter.subtractRadius = Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    static func factoryProgressCircleWith(viewModel:CircleViewModelCompletion) -> CircleViewModel {
        let radians:CGFloat = viewModel.progress.radians - Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.startAngle = Constants.startAngle + viewModel.backlog.radians
        circle.endAngle = circle.startAngle + radians
        return circle
    }
}
