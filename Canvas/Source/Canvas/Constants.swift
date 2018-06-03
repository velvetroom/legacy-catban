import UIKit

struct Constants {
    struct Drag {
        static let deltaForMovement:CGFloat = 20
    }
    
    struct Generic {
        static let animationDuration:TimeInterval = 0.3
    }
    
    struct Board {
        static let itemSpacing:CGFloat = 3
        static let leftEdge:CGFloat = 6
    }
    
    struct Column {
        static let width:CGFloat = 160
        static let paddingBottom:CGFloat = 20
    }
    
    struct ColumnTitle {
        static let height:CGFloat = 40
        static let fontSize:CGFloat = 14
        static let labelTop:CGFloat = 15
        static let labelHeight:CGFloat = 22
        static let labelLeft:CGFloat = 10
        static let alphaOff:CGFloat = 1
        static let alphaOn:CGFloat = 0.15
    }
    
    struct NewCard {
        static let icon:String = "assetCardNew"
        static let height:CGFloat = 70
        static let alphaOn:CGFloat = 0.3
        static let alphaOff:CGFloat = 1
    }
    
    struct NewColumn {
        static let icon:String = "assetColumnNew"
        static let alphaOn:CGFloat = 0.3
        static let alphaOff:CGFloat = 1
    }
    
    struct Card {
        static let contentPadding:CGFloat = 10
        static let fontSize:CGFloat = 14
        static let minContentHeight:CGFloat = 20
        static let maxHeight:CGFloat = 5000
        static let cornerRadius:CGFloat = 5
    }
}
