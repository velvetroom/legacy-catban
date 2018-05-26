import UIKit

class ViewBase:UIView {
    private(set) weak var viewBar:ViewBar!
    
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
        self.backgroundColor = UIColor.white
    }
    
    private func factoryViews() {
        self.factoryBar()
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
}
