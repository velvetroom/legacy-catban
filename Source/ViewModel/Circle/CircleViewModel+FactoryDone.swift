import UIKit

extension CircleViewModel {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.blue.cgColor
            circleOuter.subtractRadius = Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    static func factoryDoneCircleWith(viewModel:CircleCompletionViewModel) -> CircleViewModel {
        let radians:CGFloat = viewModel.done.radians - Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.startAngle = Constants.startAngle + viewModel.backlog.radians + viewModel.progress.radians
        circle.endAngle = circle.startAngle + radians
        return circle
    }
}
