import UIKit
import Shared

class ViewNewCard:ViewBoardItem {
    override func factoryOutlets() {
        let imageOff:UIImage = UIImage(name:ViewConstants.NewCard.icon, in:type(of:self)).withRenderingMode(
            UIImageRenderingMode.alwaysOriginal)
        let imageOn:UIImage = UIImage(name:ViewConstants.NewCard.icon, in:type(of:self)).withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
        self.button.setImage(imageOff, for:UIControlState.normal)
        self.button.setImage(imageOn, for:UIControlState.highlighted)
        self.button.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        self.button.imageView!.contentMode = UIViewContentMode.center
        self.button.imageView!.clipsToBounds = true
    }
    
    override func buttonDidSelect() {
        super.buttonDidSelect()
        self.controller.createNewCard()
    }
}
