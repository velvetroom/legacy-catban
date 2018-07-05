import UIKit

struct ViewConstants {
    struct Icon {
        static let assetNotClouded:String = "assetNotClouded"
        static let assetCloud:String = "assetCloud"
        static let assetUpToDate:String = "assetUpToDate"
        static let assetError:String = "assetError"
        static let size:CGFloat = 80
    }
    
    struct Label {
        static let fontSize:CGFloat = 14
        static let margin:CGFloat = 30
    }
    
    struct Action {
        static let asset:String = "assetAction"
        static let width:CGFloat = 192
        static let height:CGFloat = 64
        static let bottom:CGFloat = -25
        static let fontSize:CGFloat = 16
    }
    
    struct Toolbar {
        static let fixedSpace:CGFloat = 30
    }
    
    struct ShareBackground {
        static let animationDuration:TimeInterval = 0.3
        static let alphaOpen:CGFloat = 1
        static let alphaClose:CGFloat = 0
    }
    
    struct ShareBase {
        static let animationDuration:TimeInterval = 0.2
        static let height:CGFloat = 310
        static let borderHeight:CGFloat = 1
    }
    
    struct ShareDone {
        static let fontSize:CGFloat = 16
        static let width:CGFloat = 120
        static let height:CGFloat = 32
        static let bottom:CGFloat = -20
    }
}
