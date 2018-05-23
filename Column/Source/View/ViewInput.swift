import UIKit

class ViewInput:UIView {
    private(set) weak var field:UITextField!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func factoryOutlets() {
        self.factoryTitle()
        self.factoryLine()
        self.factoryField()
        self.factorySubtitle()
    }
    
    private func factoryTitle() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize:ViewConstants.Title.fontSize, weight:UIFont.Weight.medium)
        label.text = String.localized(key:"ViewInput_titleLabel", in:type(of:self))
        
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant:ViewConstants.Title.height).isActive = true
        label.widthAnchor.constraint(equalToConstant:ViewConstants.Title.width).isActive = true
        label.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
    
    private func factoryLine() {
        let line:UIView = UIView()
        line.isUserInteractionEnabled = false
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(white:0.9, alpha:1)
        
        self.addSubview(line)
        
        line.topAnchor.constraint(equalTo:self.topAnchor, constant:ViewConstants.Line.top).isActive = true
        line.heightAnchor.constraint(equalToConstant:ViewConstants.Line.height).isActive = true
        line.widthAnchor.constraint(equalToConstant:ViewConstants.Line.width).isActive = true
        line.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
    
    private func factoryField() {
        let field:UITextField = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.clear
        field.font = UIFont.systemFont(ofSize:ViewConstants.Field.fontSize, weight:UIFont.Weight.regular)
        field.textColor = UIColor(white:0.4, alpha:1)
        field.tintColor = UIColor.black
        field.autocapitalizationType = UITextAutocapitalizationType.words
        field.autocorrectionType = UITextAutocorrectionType.no
        field.returnKeyType = UIReturnKeyType.done
        field.spellCheckingType = UITextSpellCheckingType.no
        field.borderStyle = UITextBorderStyle.none
        field.clearButtonMode = UITextFieldViewMode.never
        field.clearsOnBeginEditing = false
        field.clearsOnInsertion = false
        field.keyboardAppearance = UIKeyboardAppearance.light
        field.keyboardType = UIKeyboardType.alphabet
        self.field = field
        
        self.addSubview(field)
        
        field.topAnchor.constraint(equalTo:self.topAnchor, constant:ViewConstants.Field.top).isActive = true
        field.widthAnchor.constraint(equalToConstant:ViewConstants.Field.width).isActive = true
        field.heightAnchor.constraint(equalToConstant:ViewConstants.Field.height).isActive = true
        field.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
    
    private func factorySubtitle() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor(white:0.7, alpha:1)
        label.font = UIFont.systemFont(ofSize:ViewConstants.Subtitle.fontSize, weight:UIFont.Weight.regular)
        label.text = String.localized(key:"ViewInput_subtitleLabel", in:type(of:self))
        
        self.addSubview(label)
        
        label.topAnchor.constraint(
            equalTo:self.field.bottomAnchor, constant:ViewConstants.Subtitle.top).isActive = true
        label.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        label.widthAnchor.constraint(equalToConstant:ViewConstants.Subtitle.width).isActive = true
        label.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
}
