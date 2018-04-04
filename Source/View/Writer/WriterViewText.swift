import UIKit

class WriterViewText:UITextView {
    init() {
        super.init(frame:CGRect.zero, textContainer:nil)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.black
        self.tintColor = UIColor.black
        self.bounces = true
        self.alwaysBounceVertical = true
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = true
        self.showsHorizontalScrollIndicator = false
        self.returnKeyType = UIReturnKeyType.default
        self.keyboardAppearance = UIKeyboardAppearance.light
        self.autocorrectionType = UITextAutocorrectionType.no
        self.spellCheckingType = UITextSpellCheckingType.yes
        self.autocapitalizationType = UITextAutocapitalizationType.sentences
        self.keyboardType = UIKeyboardType.alphabet
        self.contentInset = UIEdgeInsets.zero
        self.textAlignment = NSTextAlignment.left
        self.font = UIFont.systemFont(ofSize:Constants.fontSize, weight:UIFont.Weight.light)
        self.textContainerInset = UIEdgeInsets(
            top:Constants.insetsTop,
            left:Constants.insetsHorizontal,
            bottom:Constants.insetsBottom,
            right:Constants.insetsHorizontal)
        
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
