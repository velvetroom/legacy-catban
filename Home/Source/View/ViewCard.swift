import UIKit

class ViewCard:ViewBoardItem {
    var identifier:String!
    private(set) weak var labelContent:UILabel!
    
    override func buttonDidSelect() {
        self.showOn()
        self.controller.editCardWith(identifier:self.identifier)
    }
    
    override func factoryOutlets() {
        super.factoryOutlets()
        self.factoryLabel()
        self.configureView()
        self.configureButton()
    }
    
    private func factoryLabel() {
        let labelContent:UILabel = UILabel()
        labelContent.isUserInteractionEnabled = false
        labelContent.translatesAutoresizingMaskIntoConstraints = false
        labelContent.backgroundColor = UIColor.clear
        labelContent.numberOfLines = 0
        labelContent.font = UIFont.systemFont(ofSize:ViewConstants.Card.fontSize, weight:UIFont.Weight.regular)
        self.labelContent = labelContent
        
        self.addSubview(labelContent)
        
        labelContent.topAnchor.constraint(equalTo:self.topAnchor,
                                          constant:ViewConstants.Card.contentPadding).isActive = true
        labelContent.bottomAnchor.constraint(equalTo:self.bottomAnchor,
                                             constant:-ViewConstants.Card.contentPadding).isActive = true
        labelContent.leftAnchor.constraint(equalTo:self.leftAnchor,
                                           constant:ViewConstants.Card.contentPadding).isActive = true
        labelContent.rightAnchor.constraint(equalTo:self.rightAnchor,
                                            constant:-ViewConstants.Card.contentPadding).isActive = true
    }
    
    private func configureView() {
        self.layer.cornerRadius = ViewConstants.Card.cornerRadius
        self.showOff()
    }
    
    private func configureButton() {
        self.button.addTarget(self, action:#selector(self.selectorHighlighted(sender:)),
                              for:UIControlEvents.touchDown)
        self.button.addTarget(self, action:#selector(self.selectorReleased(sender:)),
                              for:UIControlEvents.touchUpOutside)
        self.button.addTarget(self, action:#selector(self.selectorReleased(sender:)),
                              for:UIControlEvents.touchCancel)
    }
    
    private func showOn() {
        UIView.animate(withDuration:ViewConstants.Generic.animationDuration) { [weak self] in
            self?.backgroundColor = UIColor.Shared.blue
            self?.labelContent.textColor = UIColor.white
        }
    }
    
    private func showOff() {
        UIView.animate(withDuration:ViewConstants.Generic.animationDuration) { [weak self] in
            self?.backgroundColor = UIColor.white
            self?.labelContent.textColor = UIColor.black
        }
    }
    
    @objc private func selectorHighlighted(sender button:UIButton) {
        self.showOn()
    }
    
    @objc private func selectorReleased(sender button:UIButton) {
        self.showOff()
    }
}
