import UIKit
import Shared

class ViewMenuOptions:UIView {
    weak var closeButton:UIButton!
    weak var optionProjects:ViewMenuOption!
    weak var optionAbout:ViewMenuOption!
    weak var layoutRootTop:NSLayoutConstraint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func animateOpen() {
        let deadline:DispatchTime = DispatchTime.now() + ViewConstants.Background.animationDuration
        DispatchQueue.main.asyncAfter(deadline:deadline) { [weak self] in
            self?.animateAfterDelay()
        }
    }
    
    func animateClose() {
        self.layoutRootTop.constant = ViewConstants.Options.rootTopClose
        self.animateWith(alpha:ViewConstants.Options.alphaClose)
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = ViewConstants.Options.alphaClose
    }
    
    private func factoryViews() {
        self.factoryCloseButton()
        self.factoryProjects()
        self.factoryAbout()
    }
    
    private func factoryCloseButton() {
        let closeButton:UIButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton = closeButton
        self.addSubview(closeButton)
        
        closeButton.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        closeButton.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        closeButton.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        closeButton.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func factoryProjects() {
        self.optionProjects = self.factoryOptionWith(
            icon:ViewConstants.Projects.icon, name:String.localized(key:"ViewMenuOption_Projects", in:type(of:self)))
        self.optionProjects.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.layoutRootTop = self.optionProjects.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.Options.rootTopClose)
        self.layoutRootTop.isActive = true
    }
    
    private func factoryAbout() {
        
        self.optionAbout = self.factoryOptionWith(
            icon:ViewConstants.About.icon, name:String.localized(key:"ViewMenuOption_About", in:type(of:self)))
        self.optionAbout.centerXAnchor.constraint(equalTo:self.optionProjects.centerXAnchor).isActive = true
        self.optionAbout.topAnchor.constraint(
            equalTo:self.optionProjects.bottomAnchor, constant:ViewConstants.About.top).isActive = true
    }
    
    private func factoryOptionWith(icon:String, name:String) -> ViewMenuOption {
        let option:ViewMenuOption = ViewMenuOption()
        option.load(icon:icon)
        option.nameLabel.text = name
        self.addSubview(option)
        option.layoutSize()
        return option
    }
    
    private func animateAfterDelay() {
        self.layoutRootTop.constant = ViewConstants.Options.rootTopOpen
        self.animateWith(alpha:ViewConstants.Options.alphaOpen)
    }
    
    private func animateWith(alpha:CGFloat) {
        UIView.animate(withDuration:ViewConstants.Options.animationDuration) { [weak self] in
            self?.alpha = alpha
            self?.layoutIfNeeded()
        }
    }
}
