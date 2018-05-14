import UIKit
import Shared

class ViewNewCard:ViewBoardItem {
    override func showOn() {
        self.alpha = ViewConstants.NewCard.alphaOn
    }
    
    override func showOff() {
        self.alpha = ViewConstants.NewCard.alphaOff
    }
    
    override func factoryOutlets() {
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
