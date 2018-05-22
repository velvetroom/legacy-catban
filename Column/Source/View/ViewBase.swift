import UIKit

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
}
