import UIKit

class ViewInputField:UITextField {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.font = UIFont.systemFont(ofSize:ViewConstants.Field.fontSize, weight:UIFont.Weight.light)
        self.textColor = UIColor.black
        self.tintColor = UIColor.black
        self.autocapitalizationType = UITextAutocapitalizationType.words
        self.autocorrectionType = UITextAutocorrectionType.no
        self.returnKeyType = UIReturnKeyType.done
        self.spellCheckingType = UITextSpellCheckingType.no
        self.borderStyle = UITextBorderStyle.none
        self.clearButtonMode = UITextFieldViewMode.never
        self.clearsOnBeginEditing = false
        self.clearsOnInsertion = false
        self.keyboardAppearance = UIKeyboardAppearance.light
        self.keyboardType = UIKeyboardType.alphabet
    }
}
