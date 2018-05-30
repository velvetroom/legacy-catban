import UIKit
import Shared

class ViewRenamer:UIView {
    weak var viewInput:ViewRenamerInput!
    weak var viewField:ViewRenamerField!
    weak var button:UIButton!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.Shared.blue
    }
    
    private func factoryViews() {
        self.factoryButton()
        self.factoryInput()
        self.factoryField()
    }
    
    private func factoryButton() {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(String.localized(key:"ViewRenamer_button", in:type(of:self)), for:UIControlState())
        button.titleLabel!.font = UIFont.systemFont(
            ofSize:ViewConstants.RenamerButton.fontSize, weight:UIFont.Weight.bold)
        button.setTitleColor(UIColor.white, for:UIControlState.normal)
        button.setTitleColor(UIColor(white:1, alpha:0.2), for:UIControlState.highlighted)
        self.button = button
        self.addSubview(button)
        
        button.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        button.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant:ViewConstants.RenamerButton.width).isActive = true
    }
    
    private func factoryInput() {
        let viewInput:ViewRenamerInput = ViewRenamerInput()
        self.viewInput = viewInput
        self.addSubview(viewInput)
        
        viewInput.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.RenamerField.margin).isActive = true
        viewInput.bottomAnchor.constraint(
            equalTo:self.bottomAnchor, constant:ViewConstants.RenamerField.margin).isActive = true
        viewInput.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.RenamerField.margin).isActive = true
        viewInput.rightAnchor.constraint(
            equalTo:self.button.leftAnchor, constant:-ViewConstants.RenamerField.margin).isActive = true
    }
    
    private func factoryField() {
        let viewField:ViewRenamerField = ViewRenamerField()
        self.viewField = viewField
        self.addSubview(viewField)
        
        viewField.topAnchor.constraint(equalTo:self.viewInput.topAnchor).isActive = true
        viewField.bottomAnchor.constraint(equalTo:self.viewInput.bottomAnchor).isActive = true
        viewField.leftAnchor.constraint(
            equalTo:self.viewInput.leftAnchor, constant:ViewConstants.RenamerField.margin).isActive = true
        viewField.rightAnchor.constraint(
            equalTo:self.viewInput.rightAnchor, constant:-ViewConstants.RenamerField.margin).isActive = true
    }
}
