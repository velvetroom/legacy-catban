import UIKit
import Shared

public class ViewContent:UIView {
    weak var icon:UIImageView!
    weak var label:UILabel!
    weak var button:UIButton!
    
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
        self.makeButton()
    }
    
    private func layoutOutlets() {
        self.layoutIcon()
        self.layoutLabel()
        self.layoutButton()
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
        label.textColor = UIColor(white:0, alpha:0.6)
        label.font = UIFont.systemFont(ofSize:ViewConstants.Title.fontSize, weight:UIFont.Weight.regular)
        self.label = label
        self.addSubview(label)
    }
    
    private func makeButton() {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(name:ViewConstants.Action.asset, in:type(of:self)), for:UIControlState())
        button.subviews.first?.clipsToBounds = true
        button.subviews.first?.contentMode = UIViewContentMode.center
        button.clipsToBounds = true
        button.contentMode = UIViewContentMode.center
        button.setTitleColor(UIColor.white, for:UIControlState.normal)
        button.setTitleColor(UIColor(white:1, alpha:0.2), for:UIControlState.highlighted)
        button.setTitle(String.localized(key:"ViewNotClouded_Button", in:type(of:self)), for:UIControlState())
        button.titleLabel!.font = UIFont.systemFont(ofSize:ViewConstants.Action.fontSize, weight:UIFont.Weight.bold)
        button.isHidden = true
        self.button = button
        self.addSubview(button)
    }
    
    private func layoutIcon() {
        self.icon.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        self.icon.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.icon.widthAnchor.constraint(equalToConstant:ViewConstants.Icon.size).isActive = true
        self.icon.heightAnchor.constraint(equalToConstant:ViewConstants.Icon.size).isActive = true
    }
    
    private func layoutLabel() {
        self.label.topAnchor.constraint(equalTo:self.icon.bottomAnchor).isActive = true
        self.label.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.label.heightAnchor.constraint(equalToConstant:ViewConstants.Title.height).isActive = true
        self.label.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutButton() {
        self.button.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.button.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor,
                                            constant:ViewConstants.Action.bottom).isActive = true
        self.button.widthAnchor.constraint(equalToConstant:ViewConstants.Action.width).isActive = true
        self.button.heightAnchor.constraint(equalToConstant:ViewConstants.Action.height).isActive = true
    }
}
