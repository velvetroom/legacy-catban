import UIKit

struct ViewConstants {
    struct Bar {
        static let height:CGFloat = 70
        static let borderWidth:CGFloat = 0.5
    }
    
    struct Add {
        static let imageOn:String = "assetAddOn"
        static let imageOff:String = "assetAddOff"
        static let size:CGFloat = 68
    }
    
    struct BarTitle {
        static let left:CGFloat = 20
        static let height:CGFloat = 45
        static let fontSize:CGFloat = 22
    }
    
    struct Menu {
        static let height:CGFloat = 80
        static let borderWidth:CGFloat = 1
        static let borderMargin:CGFloat = 20
        static let alphaOn:CGFloat = 1
        static let alphaOff:CGFloat = 0.3
    }
    
    struct Empty {
        static let icon:String = "assetEmpty"
        static let iconSize:CGFloat = 92
        static let iconBottom:CGFloat = -30
        static let fontSize:CGFloat = 16
    }
    
    struct ListItem {
        static let identifier:String = String(ObjectIdentifier(ViewListCell.self).hashValue)
    }
}
