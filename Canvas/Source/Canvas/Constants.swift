import UIKit

struct Constants {
    struct Drag {
        static let deltaForMovement:CGFloat = 20
    }
    
    struct Generic {
        static let animationDuration:TimeInterval = 0.3
    }
    
    struct Board {
        static let paddingHorizontal:CGFloat = 20
        static let horizontalSpacing:CGFloat = 15
        static let verticalSpacing:CGFloat = 4
    }
    
    struct Column {
        static let width:CGFloat = 200
        static let paddingBottom:CGFloat = 20
    }
    
    struct ColumnTitle {
        static let iconImage:String = "assetColumnIcon"
        static let height:CGFloat = 70
        static let fontSize:CGFloat = 14
        static let labelTop:CGFloat = 30
        static let labelHeight:CGFloat = 20
        static let labelLeft:CGFloat = 14
        static let labelAlpha:CGFloat = 0.3
        static let iconTop:CGFloat = 30
        static let iconHeight:CGFloat = 22
        static let iconWidth:CGFloat = 14
    }
    
    struct NewCard {
        static let icon:String = "assetNewCard"
        static let height:CGFloat = 70
        static let alphaOn:CGFloat = 0.3
        static let alphaOff:CGFloat = 1
    }
    
    struct Card {
        static let contentPadding:CGFloat = 15
        static let fontSize:CGFloat = 16
        static let minContentHeight:CGFloat = 15
        static let maxHeight:CGFloat = 1000
        static let cornerRadius:CGFloat = 4
    }
}
