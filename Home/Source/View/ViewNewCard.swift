import UIKit

class ViewNewCard:UIView {
    var identifier:String
    weak var controller:Controller!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutHeight:NSLayoutConstraint!
    weak var layoutWidth:NSLayoutConstraint!
    private(set) weak var labelContent:UILabel!
    
    init() {
        self.identifier = String()
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    @objc func selectorButton(sender button:UIButton) {
        self.controller.editCardWith(identifier:self.identifier)
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func factoryOutlets() {
        self.factoryButton()
    }
    
    private func factoryButton() {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(self.selectorButton(sender:)), for:UIControlEvents.touchUpInside)
        self.addSubview(button)
        
        button.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
