import UIKit
import Shared

class DeleterViewMenu:UIView {
    weak var layoutBottom:NSLayoutConstraint!
    weak var labelTitle:UILabel!
    weak var labelName:UILabel!
    weak var buttonConfirm:UIButton!
    weak var buttonCancel:UIButton!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor(white:0, alpha:0.3)
    }
    
    private func makeOutlets() {
        self.makeTitle()
        self.makeName()
        self.makeConfirm()
        self.makeCancel()
    }
    
    private func layoutOutlets() {
        self.layoutTitle()
        self.layoutName()
        self.layoutConfirm()
        self.layoutCancel()
    }
    
    private func makeTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor(white:1, alpha:0.6)
        labelTitle.font = UIFont.systemFont(ofSize:DeleterConstats.Title.fontSize, weight:UIFont.Weight.regular)
        self.labelTitle = labelTitle
        self.addSubview(labelTitle)
    }
    
    func makeName() {
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.textAlignment = NSTextAlignment.center
        labelName.textColor = UIColor(white:1, alpha:0.8)
        labelName.font = UIFont.systemFont(ofSize:DeleterConstats.Name.fontSize, weight:UIFont.Weight.medium)
        self.labelName = labelName
        self.addSubview(labelName)
    }
    
    private func makeConfirm() {
        let buttonConfirm:UIButton = UIButton()
        buttonConfirm.translatesAutoresizingMaskIntoConstraints = false
        buttonConfirm.clipsToBounds = true
        buttonConfirm.backgroundColor = UIColor.Shared.red
        buttonConfirm.setTitle(String.localized(key:"DeleterViewMenu_buttonConfirm", in:type(of:self)), for:UIControlState())
        buttonConfirm.setTitleColor(UIColor.white, for:UIControlState.normal)
        buttonConfirm.setTitleColor(UIColor(white:1, alpha:0.1), for:UIControlState.highlighted)
        buttonConfirm.titleLabel!.font = UIFont.systemFont(ofSize:DeleterConstats.Confirm.fontSize,
                                                           weight:UIFont.Weight.bold)
        buttonConfirm.layer.cornerRadius = DeleterConstats.Confirm.cornerRadius
        self.buttonConfirm = buttonConfirm
        self.addSubview(buttonConfirm)
    }
    
    private func makeCancel() {
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitle(String.localized(key:"DeleterViewMenu_buttonCancel", in:type(of:self)), for:UIControlState())
        buttonCancel.setTitleColor(UIColor(white:1, alpha:0.4), for:UIControlState.normal)
        buttonCancel.setTitleColor(UIColor(white:1, alpha:0.1), for:UIControlState.highlighted)
        buttonCancel.titleLabel!.font = UIFont.systemFont(ofSize:DeleterConstats.Cancel.fontSize,
                                                           weight:UIFont.Weight.medium)
        self.buttonCancel = buttonCancel
        self.addSubview(buttonCancel)
    }
    
    private func layoutTitle() {
        self.labelTitle.topAnchor.constraint(equalTo:self.topAnchor, constant:DeleterConstats.Title.top).isActive = true
        self.labelTitle.heightAnchor.constraint(equalToConstant:DeleterConstats.Title.height).isActive = true
        self.labelTitle.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.labelTitle.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutName() {
        self.labelName.topAnchor.constraint(equalTo:self.labelTitle.bottomAnchor).isActive = true
        self.labelName.heightAnchor.constraint(equalToConstant:DeleterConstats.Name.height).isActive = true
        self.labelName.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutConfirm() {
        self.buttonConfirm.topAnchor.constraint(equalTo:self.labelName.bottomAnchor,
                                                constant:DeleterConstats.Confirm.top).isActive = true
        self.buttonConfirm.heightAnchor.constraint(equalToConstant:DeleterConstats.Confirm.height).isActive = true
        self.buttonConfirm.leftAnchor.constraint(equalTo:self.leftAnchor,
                                                 constant:DeleterConstats.Confirm.marginHorizontal).isActive = true
        self.buttonConfirm.rightAnchor.constraint(equalTo:self.rightAnchor,
                                                  constant:-DeleterConstats.Confirm.marginHorizontal).isActive = true
    }
    
    private func layoutCancel() {
        self.buttonCancel.topAnchor.constraint(equalTo:self.buttonConfirm.bottomAnchor).isActive = true
        self.buttonCancel.heightAnchor.constraint(equalToConstant:DeleterConstats.Cancel.height).isActive = true
        self.buttonCancel.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.buttonCancel.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
