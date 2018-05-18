import UIKit
import Shared

class ViewNewCard:ViewItem {
    override init() {
        super.init()
        self.dragState = DragStateFixed.self
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func triggerAction(controller:Controller) {
        super.triggerAction(controller:controller)
        controller.createNewCard()
    }
    
    override func stateHighlighted() {
        super.stateHighlighted()
        self.alpha = ViewConstants.NewCard.alphaOn
    }
    
    override func stateNormal() {
        super.stateNormal()
        self.alpha = ViewConstants.NewCard.alphaOff
    }
    
    override func factoryOutlets() {
        super.factoryOutlets()
        let image:UIImageView = UIImageView()
        image.image = UIImage(name:ViewConstants.NewCard.icon, in:type(of:self))
        image.isUserInteractionEnabled = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.center
        image.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(image)
        
        image.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        image.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
