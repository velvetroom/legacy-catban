import UIKit

extension LandingViewModel {
    struct Constants {
        static let collectionMenuAnimationDuration:TimeInterval = 0.3
        static let waitBeforeScrolling:TimeInterval = 0.1
        private static let baseCollectionMenuHeight:CGFloat = 45
        private static let safeAreaAddedHeight:CGFloat = 10
        
        static var collectionMenuHeight:CGFloat {
            get {
                var height:CGFloat = baseCollectionMenuHeight
                if let safeAreaBottom:CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
                    if safeAreaBottom > 0 {
                        height += safeAreaAddedHeight
                    }
                }
                return height
            }
        }
    }
}
