import UIKit

struct ViewConstants {
    struct Board {
        static let paddingHorizontal:CGFloat = 20
        static let columnSpacing:CGFloat = 10
        static let cardSpacing:CGFloat = 4
    }
    
    struct Column {
        static let width:CGFloat = 240
        static let paddingHorizontal:CGFloat = 10
        static let paddingBottom:CGFloat = 40
    }
    
    struct ColumnTitle {
        static let iconImage:String = "assetColumnIcon"
        static let height:CGFloat = 60
        static let fontSize:CGFloat = 15
        static let labelTop:CGFloat = 30
        static let labelHeight:CGFloat = 20
        static let labelLeft:CGFloat = 14
        static let labelAlpha:CGFloat = 0.3
        static let iconTop:CGFloat = 30
        static let iconHeight:CGFloat = 22
        static let iconWidth:CGFloat = 14
    }
    
    struct Card {
        static let contentPadding:CGFloat = 15
        static let fontSize:CGFloat = 15
        static let minContentHeight:CGFloat = 10
        static let maxHeight:CGFloat = 1000
    }
}
