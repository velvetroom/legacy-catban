import UIKit
import Shared

class ViewRenamerField:UITextField {
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
        self.placeholder = String.localized(key:"ViewRenamerField_placeholder", in:type(of:self))
        self.font = UIFont.systemFont(ofSize:ViewConstants.RenamerField.fontSize, weight:UIFont.Weight.regular)
        self.textColor = UIColor.black
        self.tintColor = UIColor.black
        self.autocapitalizationType = UITextAutocapitalizationType.sentences
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
