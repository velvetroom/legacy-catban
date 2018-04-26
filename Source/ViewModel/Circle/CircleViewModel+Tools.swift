import UIKit

extension CircleViewModel {
    static func percentToRadians(percent:CGFloat) -> CGFloat {
        return Constants.circleRadians * percent
    }
}
