import UIKit
import Board

class ViewCard:UIView {
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
        self.showSelected()
        self.controller.editCardWith(identifier:self.identifier)
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.layer.cornerRadius = ViewConstants.Card.cornerRadius
    }
    
    private func factoryOutlets() {
        self.factoryButton()
        self.factoryLabel()
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
    
    private func factoryLabel() {
        let labelContent:UILabel = UILabel()
        labelContent.isUserInteractionEnabled = false
        labelContent.translatesAutoresizingMaskIntoConstraints = false
        labelContent.backgroundColor = UIColor.clear
        labelContent.numberOfLines = 0
        labelContent.font = UIFont.systemFont(ofSize:ViewConstants.Card.fontSize, weight:UIFont.Weight.regular)
        labelContent.textColor = UIColor.black
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
    
    private func showSelected() {
        UIView.animate(withDuration:ViewConstants.Generic.animationDuration) { [weak self] in
            self?.backgroundColor = UIColor.Shared.blue
            self?.labelContent.textColor = UIColor.white
        }
    }
}
