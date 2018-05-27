import UIKit
import Shared

class ViewEmpty:UIView {
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
        self.isUserInteractionEnabled = false
    }
    
    private func factoryViews() {
        self.factoryLabel()
        self.factoryIcon()
    }
    
    private func factoryLabel() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize:ViewConstants.Empty.fontSize, weight:UIFont.Weight.regular)
        label.textColor = UIColor(white:0, alpha:0.6)
        label.text = String.localized(key:"ViewEmpty_label", in:type(of:self))
        self.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        label.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        label.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func factoryIcon() {
        let icon:UIImageView = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = UIImage(name:ViewConstants.Empty.icon, in:type(of:self))
        self.addSubview(icon)

        icon.bottomAnchor.constraint(
            equalTo:self.centerYAnchor, constant:ViewConstants.Empty.iconBottom).isActive = true
        icon.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant:ViewConstants.Empty.iconSize).isActive = true
        icon.heightAnchor.constraint(equalToConstant:ViewConstants.Empty.iconSize).isActive = true
    }
}
