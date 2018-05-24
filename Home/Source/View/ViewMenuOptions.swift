import UIKit

class ViewMenuOptions:UIView {
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
    }
    
    private func factoryProjects() {
        
    }
}
