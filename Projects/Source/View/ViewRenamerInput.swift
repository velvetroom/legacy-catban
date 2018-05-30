import UIKit
import Shared

class ViewRenamerInput:UIView {
    weak var viewBase:UIView!
    weak var viewField:ViewRenamerField!
    weak var doneButton:UIButton!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        self.backgroundColor = UIColor.Shared.blue
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func factoryViews() {
        self.factoryButton()
        self.factoryBase()
        self.factoryField()
    }
    
    private func factoryBase() {
        let viewBase:UIView = UIView()
        viewBase.backgroundColor = UIColor.white
        viewBase.translatesAutoresizingMaskIntoConstraints = false
        viewBase.clipsToBounds = true
        viewBase.isUserInteractionEnabled = false
        viewBase.layer.cornerRadius = ViewConstants.RenamerInput.cornerRadius
        self.viewBase = viewBase
        self.addSubview(viewBase)
        
        viewBase.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.RenamerField.margin).isActive = true
        viewBase.bottomAnchor.constraint(
            equalTo:self.bottomAnchor, constant:-ViewConstants.RenamerField.margin).isActive = true
        viewBase.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.RenamerField.margin).isActive = true
        viewBase.rightAnchor.constraint(
            equalTo:self.doneButton.leftAnchor, constant:-ViewConstants.RenamerField.margin).isActive = true
    }
    
    private func factoryButton() {
        let doneButton:UIButton = UIButton()
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle(
            String.localized(key:"ViewRenamerInput_doneButton", in:type(of:self)), for:UIControlState())
        doneButton.setTitleColor(UIColor.white, for:UIControlState.normal)
        doneButton.setTitleColor(UIColor(white:1, alpha:0.2), for:UIControlState.highlighted)
        doneButton.setTitleColor(UIColor(white:1, alpha:0.2), for:UIControlState.selected)
        doneButton.titleLabel!.font = UIFont.systemFont(
            ofSize:ViewConstants.RenamerButton.fontSize, weight:UIFont.Weight.bold)
        self.doneButton = doneButton
        self.addSubview(doneButton)
        
        doneButton.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        doneButton.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant:ViewConstants.RenamerButton.width).isActive = true
    }
    
    private func factoryField() {
        let viewField:ViewRenamerField = ViewRenamerField()
        self.viewField = viewField
        self.addSubview(viewField)
        
        viewField.topAnchor.constraint(equalTo:self.viewBase.topAnchor).isActive = true
        viewField.bottomAnchor.constraint(equalTo:self.viewBase.bottomAnchor).isActive = true
        viewField.leftAnchor.constraint(
            equalTo:self.viewBase.leftAnchor, constant:ViewConstants.RenamerField.margin).isActive = true
        viewField.rightAnchor.constraint(
            equalTo:self.viewBase.rightAnchor, constant:-ViewConstants.RenamerField.margin).isActive = true
    }
}
