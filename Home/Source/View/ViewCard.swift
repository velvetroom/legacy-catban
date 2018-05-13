import UIKit

class ViewCard:ViewBoardItem {
    var identifier:String!
    private(set) weak var labelContent:UILabel!
    
    override func buttonDidSelect() {
        self.showSelected()
        self.controller.editCardWith(identifier:self.identifier)
    }
    
    override func factoryOutlets() {
        super.factoryOutlets()
        self.configureView()
        self.factoryLabel()
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = ViewConstants.Card.cornerRadius
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
