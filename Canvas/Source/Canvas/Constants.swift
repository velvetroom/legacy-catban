import UIKit

struct Constants {
    struct Drag {
        static let deltaForMovement:CGFloat = 20
    }
    
    struct Generic {
        static let animationDuration:TimeInterval = 0.3
    }
    
    struct Board {
        static let paddingHorizontal:CGFloat = 4
        static let verticalSpacing:CGFloat = 4
    }
    
    struct Column {
        static let width:CGFloat = 160
        static let paddingBottom:CGFloat = 20
    }
    
    struct ColumnTitle {
        static let icon:String = "assetColumnIcon"
        static let height:CGFloat = 40
        static let fontSize:CGFloat = 16
        static let labelTop:CGFloat = 15
        static let labelHeight:CGFloat = 22
        static let labelLeft:CGFloat = 14
        static let iconTop:CGFloat = 15
        static let iconLeft:CGFloat = -4
        static let iconHeight:CGFloat = 22
        static let iconWidth:CGFloat = 18
        static let alphaOff:CGFloat = 1
        static let alphaOn:CGFloat = 0.15
    }
    
    struct NewCard {
        static let icon:String = "assetNewCard"
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
        static let contentPadding:CGFloat = 12
        static let fontSize:CGFloat = 12
        static let minContentHeight:CGFloat = 20
        static let maxHeight:CGFloat = 5000
        static let cornerRadius:CGFloat = 4
    }
}
