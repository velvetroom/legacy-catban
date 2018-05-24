import UIKit

struct ViewConstants {
    struct Menu {
        static let icon:String = "assetMenu"
        static let menuDismissTimeout:TimeInterval = 0.5
    }
    
    struct Base {
        static let translationClose:TimeInterval = 0.6
    }
    
    struct Background {
        static let animationDuration:TimeInterval = 0.4
        static let alphaOpen:CGFloat = 1
        static let alphaClose:CGFloat = 0
    }
    
    struct Close {
        static let icons:String = "assetClose"
        static let animationDuration:TimeInterval = 0.5
        static let animationRepeat:Int = 1
        static let totalImages:Int = 11
    }
}
