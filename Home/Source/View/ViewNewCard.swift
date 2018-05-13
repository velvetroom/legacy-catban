import UIKit
import Shared

class ViewNewCard:ViewBoardItem {
    override func factoryOutlets() {
        let image:UIImage = UIImage(name:ViewConstants.NewCard.icon, in:type(of:self))
        self.button.setImage(image, for:UIControlState.normal)
        self.button.imageView!.contentMode = UIViewContentMode.center
        self.button.imageView!.clipsToBounds = true
    }
    
    override func buttonDidSelect() {
        super.buttonDidSelect()
    }
}
