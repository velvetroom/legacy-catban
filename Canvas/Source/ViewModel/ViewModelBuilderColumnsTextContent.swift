import UIKit

class ViewModelBuilderColumnsTextContent {
    let width:CGFloat
    private let attributes:[NSAttributedStringKey:Any]
    private let options:NSStringDrawingOptions
    private let size:CGSize
    private let minHeight:CGFloat
    private let innerPadding:CGFloat
    
    init() {
        let innerPadding:CGFloat = ViewConstants.Card.contentPadding + ViewConstants.Card.contentPadding
        let maxWidth:CGFloat = ViewConstants.Column.width - innerPadding
        self.attributes = [NSAttributedStringKey.font:
            UIFont.systemFont(ofSize:ViewConstants.Card.fontSize, weight:UIFont.Weight.regular)]
        self.options = NSStringDrawingOptions([NSStringDrawingOptions.usesFontLeading,
                                               NSStringDrawingOptions.usesLineFragmentOrigin])
        self.size = CGSize(width:maxWidth, height:ViewConstants.Card.maxHeight)
        self.minHeight = innerPadding + ViewConstants.Card.minContentHeight
        self.width = ViewConstants.Column.width
        self.innerPadding = innerPadding
    }
    
    func heightFor(content:String) -> CGFloat {
        return max(self.heightForStringWith(content:content), self.minHeight)
    }
    
    private func heightForStringWith(content:String) -> CGFloat {
        let string:NSAttributedString = NSAttributedString(string:content, attributes:self.attributes)
        let rect:CGRect = string.boundingRect(with:self.size, options:self.options, context:nil)
        return ceil(rect.height) + innerPadding
    }
}
