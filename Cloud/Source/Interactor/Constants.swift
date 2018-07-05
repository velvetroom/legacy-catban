import UIKit

struct Constants {
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
        static let barHeight:CGFloat = 44
        static let animationDuration:TimeInterval = 0.2
        static let height:CGFloat = 310
        static let borderHeight:CGFloat = 1
    }
    
    struct ShareImage {
        static let alphaOn:CGFloat = 1
        static let alphaOff:CGFloat = 0
        static let animationDuration:TimeInterval = 2
    }
    
    struct Qr {
        static let prefix:String = "iturbide"
        static let suffix:String = "catban"
        static let filterName:String = "CIQRCodeGenerator"
        static let correctionKey:String = "inputCorrectionLevel"
        static let correctionValue:String = "H"
        static let contentKey:String = "inputMessage"
        static let scale:CGFloat = 3
    }
}
