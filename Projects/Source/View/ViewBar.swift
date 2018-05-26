import UIKit
import Shared

class ViewBar:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func factoryViews() {
        self.factoryBorder()
        self.factoryIcon()
        self.factoryTitle()
    }
    
    private func factoryIcon() {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = UIImage(name:ViewConstants.Bar.iconImage, in:type(of:self))
        self.addSubview(icon)
        
        icon.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        icon.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.iconHeight).isActive = true
        icon.widthAnchor.constraint(equalToConstant:ViewConstants.Bar.iconWidth).isActive = true
    }
    
    private func factoryTitle() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize:ViewConstants.Bar.fontSize, weight:UIFont.Weight.medium)
        label.text = String.localized(key:"ViewBar_title", in:type(of:self))
        self.addSubview(label)
        
        label.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        label.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.Bar.iconWidth).isActive = true
        label.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.iconHeight).isActive = true
        label.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func factoryBorder() {
        let border:UIView = UIView()
        border.isUserInteractionEnabled = false
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor(white:0, alpha:0.2)
        self.addSubview(border)
        
        border.bottomAnchor.constraint(
            equalTo:self.bottomAnchor, constant:ViewConstants.Bar.borderBottom).isActive = true
        border.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.Bar.iconWidth).isActive = true
        border.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        border.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.borderWidth).isActive = true
    }
}
