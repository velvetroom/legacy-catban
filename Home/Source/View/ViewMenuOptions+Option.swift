import UIKit

extension ViewMenuOptions {
    func makeOptions() {
        self.makeCloud()
        self.makeProjects()
        self.makeAbout()
    }
    
    func layoutOptions() {
        self.layoutCloud()
        self.layoutProjects()
        self.layoutAbout()
    }
    
    private func makeCloud() {
        self.optionCloud = self.makeOptionWith(icon:ViewConstants.Icons.cloud, name:
            String.localized(key:"ViewMenuOption_Cloud", in:type(of:self)))
    }
    
    private func makeProjects() {
        self.optionProjects = self.makeOptionWith(icon:ViewConstants.Icons.projects, name:
            String.localized(key:"ViewMenuOption_Projects", in:type(of:self)))
    }
    
    private func makeAbout() {
        self.optionAbout = self.makeOptionWith(icon:ViewConstants.Icons.about, name:
            String.localized(key:"ViewMenuOption_About", in:type(of:self)))
    }
    
    private func makeOptionWith(icon:String, name:String) -> ViewMenuOption {
        let option:ViewMenuOption = ViewMenuOption()
        option.load(icon:icon)
        option.nameLabel.text = name
        self.addSubview(option)
        self.layout(option:option)
        return option
    }
    
    private func layoutCloud() {
        self.optionCloud.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.layoutRootTop = self.optionCloud.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.Options.rootTopClose)
        self.layoutRootTop.isActive = true
    }
    
    private func layoutProjects() {
        self.optionProjects.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.optionProjects.topAnchor.constraint(
            equalTo:self.optionCloud.bottomAnchor, constant:ViewConstants.Options.margin).isActive = true
    }
    
    private func layoutAbout() {
        self.optionAbout.centerXAnchor.constraint(equalTo:self.optionProjects.centerXAnchor).isActive = true
        self.optionAbout.topAnchor.constraint(
            equalTo:self.optionProjects.bottomAnchor, constant:ViewConstants.Options.margin).isActive = true
    }
    
    private func layout(option:ViewMenuOption) {
        option.widthAnchor.constraint(equalToConstant:ViewConstants.Option.size).isActive = true
        option.heightAnchor.constraint(equalToConstant:ViewConstants.Option.size).isActive = true
    }
}
