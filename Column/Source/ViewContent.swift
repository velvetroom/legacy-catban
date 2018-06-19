import UIKit
import Shared

class ViewContent:UIView {
    private(set) weak var viewBar:ViewBar!
    private(set) weak var viewInput:ViewInput!
    private(set) weak var icon:UIImageView!
    
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
    }
    
    private func factoryOutlets() {
        self.factoryBar()
        self.factoryIcon()
        self.factoryInput()
    }
    
    private func factoryBar() {
        let viewBar:ViewBar = ViewBar()
        self.viewBar = viewBar
        
        self.addSubview(viewBar)
        
        viewBar.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        viewBar.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewBar.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
        viewBar.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.height).isActive = true
    }
    
    private func factoryIcon() {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = UIImage(name:ViewConstants.Icon.icon, in:type(of:self))
        self.icon = icon
        
        self.addSubview(icon)
        
        icon.topAnchor.constraint(
            equalTo:self.safeAreaLayoutGuide.topAnchor, constant:ViewConstants.Icon.top).isActive = true
        icon.heightAnchor.constraint(equalToConstant:ViewConstants.Icon.height).isActive = true
        icon.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant:ViewConstants.Icon.width).isActive = true
    }
    
    private func factoryInput() {
        let viewInput:ViewInput = ViewInput()
        self.viewInput = viewInput
        
        self.addSubview(viewInput)
        
        viewInput.topAnchor.constraint(
            equalTo:self.icon.bottomAnchor, constant:ViewConstants.Input.top).isActive = true
        viewInput.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewInput.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewInput.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
