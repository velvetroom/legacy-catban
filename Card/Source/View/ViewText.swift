import UIKit

class ViewText:UITextView {
    init() {
        super.init(frame:CGRect.zero, textContainer:nil)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
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
        self.font = UIFont.systemFont(ofSize:ViewConstants.Text.fontSize, weight:UIFont.Weight.regular)
        self.textContainerInset = UIEdgeInsets(
            top:ViewConstants.Text.insetsTop,
            left:ViewConstants.Text.insetsHorizontal,
            bottom:ViewConstants.Text.insetsBottom,
            right:ViewConstants.Text.insetsHorizontal)
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
