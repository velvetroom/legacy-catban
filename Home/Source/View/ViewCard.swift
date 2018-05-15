import UIKit

class ViewCard:ViewBoardItem {
    var identifier:String
    private(set) weak var labelContent:UILabel!
    
    override init() {
        self.identifier = String()
        super.init()
        self.dragStrategy = PresenterDragStrategyCard.self
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func touchSucceded(controller:Controller) {
        controller.editCardWith(identifier:self.identifier)
    }
    
    override func dragStart() {
        super.dragStart()
        UIView.animate(withDuration:ViewConstants.Generic.animationDuration) { [weak self] in
            self?.backgroundColor = UIColor.Shared.blue
            self?.labelContent.textColor = UIColor.white
        }
    }
    
    override func dragEnd() {
        super.dragEnd()
        UIView.animate(withDuration:ViewConstants.Generic.animationDuration) { [weak self] in
            self?.backgroundColor = UIColor.white
            self?.labelContent.textColor = UIColor.black
        }
    }
    
    override func factoryOutlets() {
        super.factoryOutlets()
        self.factoryLabel()
        self.configureView()
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
        self.dragEnd()
    }
}
