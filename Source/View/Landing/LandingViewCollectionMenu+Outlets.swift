import UIKit

extension LandingViewCollectionMenu {
    func addOutlets() {
        self.addBorder()
        self.addMoveRight()
        self.addMoveLeft()
        self.addClose()
    }
    
    private func addBorder() {
        let border:UIView = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.clipsToBounds = true
        border.isUserInteractionEnabled = false
        border.backgroundColor = UIColor(white:0, alpha:0.2)
        
        self.addSubview(border)
        
        border.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        border.heightAnchor.constraint(equalToConstant:Constants.borderHeight).isActive = true
        border.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        border.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func addMoveRight() {
        let buttonMoveRight:UIButton = UIButton()
        buttonMoveRight.translatesAutoresizingMaskIntoConstraints = false
        buttonMoveRight.setImage(#imageLiteral(resourceName: "assetMoveRight"), for:UIControlState.normal)
        buttonMoveRight.setImage(#imageLiteral(resourceName: "assetMoveRight").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
                                 for:UIControlState.highlighted)
        buttonMoveRight.setImage(#imageLiteral(resourceName: "assetMoveRight").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
                                 for:UIControlState.disabled)
        buttonMoveRight.imageView!.clipsToBounds = true
        buttonMoveRight.imageView!.contentMode = UIViewContentMode.center
        buttonMoveRight.imageView!.tintColor = UIColor(white:1, alpha:0.2)
        self.buttonMoveRight = buttonMoveRight
        
        self.addSubview(buttonMoveRight)
        
        buttonMoveRight.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonMoveRight.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        buttonMoveRight.rightAnchor.constraint(equalTo:self.rightAnchor,
                                               constant:Constants.buttonsMoveRight).isActive = true
        buttonMoveRight.widthAnchor.constraint(equalToConstant:Constants.buttonsMoveWidth).isActive = true
    }
    
    private func addMoveLeft() {
        let buttonMoveLeft:UIButton = UIButton()
        buttonMoveLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonMoveLeft.setImage(#imageLiteral(resourceName: "assetMoveLeft"), for:UIControlState.normal)
        buttonMoveLeft.setImage(#imageLiteral(resourceName: "assetMoveLeft").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
                                 for:UIControlState.highlighted)
        buttonMoveLeft.setImage(#imageLiteral(resourceName: "assetMoveLeft").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
                                 for:UIControlState.disabled)
        buttonMoveLeft.imageView!.clipsToBounds = true
        buttonMoveLeft.imageView!.contentMode = UIViewContentMode.center
        buttonMoveLeft.imageView!.tintColor = UIColor(white:1, alpha:0.2)
        self.buttonMoveLeft = buttonMoveLeft
        
        self.addSubview(buttonMoveLeft)
        
        buttonMoveLeft.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonMoveLeft.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        buttonMoveLeft.rightAnchor.constraint(equalTo:self.buttonMoveRight.leftAnchor).isActive = true
        buttonMoveLeft.widthAnchor.constraint(equalToConstant:Constants.buttonsMoveWidth).isActive = true
    }
    
    private func addClose() {
        let buttonClose:UIButton = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.setImage(#imageLiteral(resourceName: "assetClose"), for:UIControlState.normal)
        buttonClose.setImage(#imageLiteral(resourceName: "assetClose").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
                                for:UIControlState.highlighted)
        buttonClose.imageView!.clipsToBounds = true
        buttonClose.imageView!.contentMode = UIViewContentMode.center
        buttonClose.imageView!.tintColor = UIColor(white:1, alpha:0.2)
        self.buttonClose = buttonClose
        
        self.addSubview(buttonClose)
        
        buttonClose.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonClose.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        buttonClose.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        buttonClose.widthAnchor.constraint(equalToConstant:Constants.buttonCloseWidth).isActive = true
    }
}
