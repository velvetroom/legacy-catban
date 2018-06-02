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
    
    struct Options {
        static let alphaOpen:CGFloat = 1
        static let alphaClose:CGFloat = 0
        static let animationDuration:TimeInterval = 0.3
        static let rootTopOpen:CGFloat = 100
        static let rootTopClose:CGFloat = 40
    }
    
    struct Option {
        static let size:CGFloat = 100
        static let fontSize:CGFloat = 12
        static let nameHeight:CGFloat = 14
        static let alphaOn:CGFloat = 0.2
        static let alphaOff:CGFloat = 1
    }
    
    struct Projects {
        static let icon:String = "assetMenuProjects"
    }
    
    struct About {
        static let top:CGFloat = 50
        static let icon:String = "assetMenuAbout"
    }
}
