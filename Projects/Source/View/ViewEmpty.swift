import UIKit
import Shared

class ViewEmpty:UIView {
    weak var icon:UIImageView!
    weak var label:UILabel!
    
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
        self.isUserInteractionEnabled = false
    }
    
    private func makeOutlets() {
        self.makeLabel()
        self.makeIcon()
    }
    
    private func layoutOutlets() {
        self.layoutIcon()
        self.layoutLabel()
    }
    
    private func makeLabel() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize:ViewConstants.Empty.fontSize, weight:UIFont.Weight.regular)
        label.textColor = UIColor(white:0, alpha:0.6)
        label.text = String.localized(key:"ViewEmpty_label", in:type(of:self))
        self.label = label
        self.addSubview(label)
    }
    
    private func makeIcon() {
        let icon:UIImageView = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = UIImage(name:ViewConstants.Empty.icon, in:type(of:self))
        self.icon = icon
        self.addSubview(icon)
    }
    
    private func layoutIcon() {
        self.icon.bottomAnchor.constraint(equalTo:self.centerYAnchor,
                                          constant:ViewConstants.Empty.iconBottom).isActive = true
        self.icon.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.icon.widthAnchor.constraint(equalToConstant:ViewConstants.Empty.iconSize).isActive = true
        self.icon.heightAnchor.constraint(equalToConstant:ViewConstants.Empty.iconSize).isActive = true
    }
    
    private func layoutLabel() {
        self.label.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        self.label.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.label.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.label.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
}
