import UIKit

struct ViewConstants {
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
    
    struct Toolbar {
        static let fixedSpace:CGFloat = 15
        static let assetDelete:String = "assetDelete"
        static let assetRename:String = "assetRename"
        static let assetColumns:String = "assetColumns"
    }
}
