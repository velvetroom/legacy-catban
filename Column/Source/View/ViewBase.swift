import UIKit
import Shared

class ViewBase:UIView {
    private(set) weak var viewBar:ViewBar!
    
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
        self.backgroundColor = UIColor.white
    }
    
    private func factoryOutlets() {
        self.factoryBar()
    }
    
    private func factoryBar() {
        let viewBar:ViewBar = ViewBar()
        self.viewBar = viewBar
        
        self.addSubview(viewBar)
        
        viewBar.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewBar.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewBar.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        viewBar.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.height).isActive = true
    }
    
    private func factoryIcon() {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = UIImage(name:ViewConstants.Icon.icon, in:type(of:self))
        
        self.addSubview(icon)
        
        icon.topAnchor.constraint(equalTo:self.topAnchor, constant:ViewConstants.Icon.top).isActive = true
        icon.heightAnchor.constraint(equalToConstant:ViewConstants.Icon.height).isActive = true
        icon.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant:ViewConstants.Icon.width).isActive = true
    }
}
