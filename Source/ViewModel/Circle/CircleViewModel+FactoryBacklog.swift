import UIKit

extension CircleViewModel {
    private static var circle:CircleViewModel {
        get {
            var circleOuter:CircleViewModel = CircleViewModel()
            circleOuter.fillColour = UIColor.Shared.gray.cgColor
            circleOuter.subtractRadius = Constants.subtractRadiusOuter
            return circleOuter
        }
    }
    
    static func factoryBacklogCircleWith(viewModel:CircleViewModelCompletion) -> CircleViewModel {
        let radians:CGFloat = viewModel.backlog.radians - Constants.interSpace
        var circle:CircleViewModel = self.circle
        circle.endAngle = Constants.startAngle + radians
        return circle
    }
}
