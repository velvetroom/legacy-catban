import UIKit

class ViewMenuOptions:UIView {
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
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = ViewConstants.Options.alphaClose
    }
    
    private func factoryViews() {
        self.factoryProjects()
        self.factoryAbout()
    }
    
    private func factoryProjects() {
        self.optionProjects = self.factoryOptionWith(icon:ViewConstants.Projects.icon)
        self.optionProjects.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.layoutRootTop = self.optionProjects.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.Options.rootTopClose)
        self.layoutRootTop.isActive = true
    }
    
    private func factoryAbout() {
        self.optionAbout = self.factoryOptionWith(icon:ViewConstants.About.icon)
        self.optionAbout.centerXAnchor.constraint(equalTo:self.optionProjects.centerXAnchor).isActive = true
        self.optionAbout.topAnchor.constraint(
            equalTo:self.optionProjects.bottomAnchor, constant:ViewConstants.About.top).isActive = true
    }
    
    private func factoryOptionWith(icon:String) -> ViewMenuOption {
        let option:ViewMenuOption = ViewMenuOption()
        option.loadIcon(name:icon)
        self.addSubview(option)
        option.layoutSize()
        return option
    }
}
