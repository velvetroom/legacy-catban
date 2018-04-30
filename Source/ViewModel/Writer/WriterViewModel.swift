import UIKit

struct WriterViewModel {
    struct Constants {
        private static let baseBarHeight:CGFloat = 40
        private static let safeAreaAddedHeight:CGFloat = 15
        
        static var barHeight:CGFloat {
            get {
                var height:CGFloat = baseBarHeight
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
