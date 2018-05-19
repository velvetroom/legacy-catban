import UIKit

class PresenterCardHeight {
    private static let innerPadding:CGFloat = Constants.Card.contentPadding + Constants.Card.contentPadding
    private static let maxWidth:CGFloat = Constants.Column.width - innerPadding
    private static let minHeight:CGFloat = innerPadding + Constants.Card.minContentHeight
    private static let size:CGSize = CGSize(width:maxWidth, height:Constants.Card.maxHeight)
    private static let attributes:[NSAttributedStringKey:Any] = [
        NSAttributedStringKey.font:UIFont.systemFont(ofSize:Constants.Card.fontSize, weight:UIFont.Weight.regular)]
    private static let options:NSStringDrawingOptions = NSStringDrawingOptions([
        NSStringDrawingOptions.usesFontLeading, NSStringDrawingOptions.usesLineFragmentOrigin])
    
    class func heightFor(content:String) -> CGFloat {
        return max(heightForStringWith(content:content), minHeight)
    }
    
    private class func heightForStringWith(content:String) -> CGFloat {
        let string:NSAttributedString = NSAttributedString(string:content, attributes:attributes)
        let rect:CGRect = string.boundingRect(with:size, options:options, context:nil)
        return ceil(rect.height) + innerPadding
    }
}
