import UIKit

class ViewMenuBase:UIView {
    private(set) weak var viewBackground:ViewMenuBackground!
    private(set) weak var viewClose:ViewMenuClose!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.clear
    }
    
    private func factoryViews() {
        self.factoryBackground()
        self.factoryClose()
    }
    
    private func factoryBackground() {
        let viewBackground:ViewMenuBackground = ViewMenuBackground()
        self.viewBackground = viewBackground
        
        self.addSubview(viewBackground)

        viewBackground.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewBackground.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewBackground.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func factoryClose() {
        let viewClose:ViewMenuClose = ViewMenuClose()
        self.viewClose = viewClose
        
        self.addSubview(viewClose)
        
        viewClose.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewClose.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        viewClose.heightAnchor.constraint(equalToConstant:82).isActive = true
        viewClose.widthAnchor.constraint(equalToConstant:62).isActive = true
    }
}
