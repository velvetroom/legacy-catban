import UIKit

struct ViewConstants {
    struct Add {
        static let imageOn:String = "assetAddOn"
        static let imageOff:String = "assetAddOff"
        static let size:CGFloat = 68
    }
    
    struct Empty {
        static let icon:String = "assetEmpty"
        static let iconSize:CGFloat = 92
        static let iconBottom:CGFloat = -30
        static let fontSize:CGFloat = 16
    }
    
    struct ListItem {
        static let identifier:String = String(ObjectIdentifier(ViewListCell.self).hashValue)
        static let horizontalPadding:CGFloat = 20
        static let fontSizeOn:CGFloat = 30
        static let fontSizeOff:CGFloat = 18
        static let height:CGFloat = 50
    }
    
    struct Selector {
        static let height:CGFloat = 48
        static let animateDuration:TimeInterval = 0.3
    }
    
    struct NamerField {
        static let fontSize:CGFloat = 26
        static let width:CGFloat = 200
        static let height:CGFloat = 40
        static let top:CGFloat = 20
        static let left:CGFloat = 20
    }
    
    struct NamerBorder {
        static let height:CGFloat = 1
    }
    
    struct NamerStatus {
        static let assetValid:String = "assetValid"
        static let assetError:String = "assetError"
        static let size:CGFloat = 50
    }
    
    struct NamerError {
        static let fontSize:CGFloat = 16
        static let top:CGFloat = 5
    }
    
    struct Toolbar {
        static let fixedSpace:CGFloat = 15
        static let assetDelete:String = "assetDelete"
        static let assetRename:String = "assetRename"
        static let assetColumns:String = "assetColumns"
    }
}
