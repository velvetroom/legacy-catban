import UIKit

extension CircleViewModel {
    struct Constants {
        static let startAngle:CGFloat = CGFloat.pi / -2.0
        static let circleRadians:CGFloat = CGFloat.pi * 2.0
        static let interSpace:CGFloat = 0.02
        
        static let endAngle:CGFloat = startAngle + circleRadians
        
        static let subtractRadiusOuter:CGFloat = PrivateConstants.outerMargin
        
        static let subtractRadiusMiddle:CGFloat =
            PrivateConstants.outerMargin + PrivateConstants.outerCirclePadding
        
        static let subtractRadiusInner:CGFloat =
            PrivateConstants.outerMargin + PrivateConstants.outerCirclePadding +
                PrivateConstants.middleCirclePadding
    }
    
    private struct PrivateConstants {
        static let outerMargin:CGFloat = 40
        static let outerCirclePadding:CGFloat = 50
        static let middleCirclePadding:CGFloat = 4
    }
}
