import UIKit

class ViewBoardItem:UIView {
    weak var controller:Controller!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutHeight:NSLayoutConstraint!
    weak var layoutWidth:NSLayoutConstraint!
    private(set) weak var button:UIButton!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryBaseOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func buttonDidSelect() { }
    
    func factoryOutlets() { }
    
    @objc private func selectorButton(sender button:UIButton) {
        self.buttonDidSelect()
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func factoryBaseOutlets() {
        self.factoryButton()
        self.factoryOutlets()
    }
    
    private func factoryButton() {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(self.selectorButton(sender:)), for:UIControlEvents.touchUpInside)
        self.button = button
        
        self.addSubview(button)
        
        button.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
