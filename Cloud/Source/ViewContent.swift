import UIKit
import Shared

public class ViewContent:UIView {
    weak var icon:UIImageView!
    weak var label:UILabel!
    weak var buttonStart:UIButton!
    weak var buttonContinue:UIButton!
    
    public init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
    }
    
    private func makeOutlets() {
        self.makeIcon()
        self.makeLabel()
        self.makeButtonStart()
        self.makeButtonContinue()
    }
    
    private func layoutOutlets() {
        self.layoutIcon()
        self.layoutLabel()
        self.layoutButtonStart()
        self.layoutButtonContinue()
    }
    
    private func makeIcon() {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        self.icon = icon
        self.addSubview(icon)
    }
    
    private func makeLabel() {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textColor = UIColor(white:0, alpha:0.6)
        label.font = UIFont.systemFont(ofSize:ViewConstants.Label.fontSize, weight:UIFont.Weight.regular)
        self.label = label
        self.addSubview(label)
    }
    
    private func makeButtonStart() {
        let buttonStart:UIButton = UIButton()
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.setBackgroundImage(UIImage(name:ViewConstants.Action.asset, in:type(of:self)), for:UIControlState())
        buttonStart.setTitleColor(UIColor.white, for:UIControlState.normal)
        buttonStart.setTitleColor(UIColor(white:1, alpha:0.2), for:UIControlState.highlighted)
        buttonStart.setTitle(String.localized(key:"ViewNotClouded_ButtonStart", in:type(of:self)), for:UIControlState())
        buttonStart.titleLabel!.font = UIFont.systemFont(ofSize:ViewConstants.Action.fontSize, weight:UIFont.Weight.bold)
        buttonStart.isHidden = true
        self.buttonStart = buttonStart
        self.addSubview(buttonStart)
    }
    
    private func makeButtonContinue() {
        let buttonContinue:UIButton = UIButton()
        buttonContinue.translatesAutoresizingMaskIntoConstraints = false
        buttonContinue.setTitleColor(UIColor.black, for:UIControlState.normal)
        buttonContinue.setTitleColor(UIColor(white:0, alpha:0.2), for:UIControlState.highlighted)
        buttonContinue.setTitle(String.localized(key:"ViewNotClouded_ButtonContinue", in:type(of:self)), for:UIControlState())
        buttonContinue.titleLabel!.font = UIFont.systemFont(ofSize:ViewConstants.Action.fontSize, weight:UIFont.Weight.bold)
        buttonContinue.isHidden = true
        self.buttonContinue = buttonContinue
        self.addSubview(buttonContinue)
    }
    
    private func layoutIcon() {
        self.icon.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        self.icon.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.icon.widthAnchor.constraint(equalToConstant:ViewConstants.Icon.size).isActive = true
        self.icon.heightAnchor.constraint(equalToConstant:ViewConstants.Icon.size).isActive = true
    }
    
    private func layoutLabel() {
        self.label.topAnchor.constraint(equalTo:self.icon.bottomAnchor).isActive = true
        self.label.leftAnchor.constraint(equalTo:self.leftAnchor,
                                         constant:ViewConstants.Label.margin).isActive = true
        self.label.rightAnchor.constraint(equalTo:self.rightAnchor,
                                          constant:-ViewConstants.Label.margin).isActive = true
        self.label.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutButtonStart() {
        self.buttonStart.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.buttonStart.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor,
                                            constant:ViewConstants.Action.bottom).isActive = true
        self.buttonStart.widthAnchor.constraint(equalToConstant:ViewConstants.Action.width).isActive = true
        self.buttonStart.heightAnchor.constraint(equalToConstant:ViewConstants.Action.height).isActive = true
    }
    
    private func layoutButtonContinue() {
        self.buttonContinue.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.buttonContinue.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor,
                                                 constant:ViewConstants.Action.bottom).isActive = true
        self.buttonContinue.widthAnchor.constraint(equalToConstant:ViewConstants.Action.width).isActive = true
        self.buttonContinue.heightAnchor.constraint(equalToConstant:ViewConstants.Action.height).isActive = true
    }
}
