import UIKit

extension LandingViewCollectionMenu {
    private var highlightedColour:UIColor {
        get {
            return UIColor(white:1, alpha:0.3)
        }
    }
    
    func addOutlets() {
        self.addMoveRight()
        self.addMoveLeft()
        self.addClose()
        self.addEdit()
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
        buttonMoveRight.imageView!.tintColor = self.highlightedColour
        self.buttonMoveRight = buttonMoveRight
        
        self.addSubview(buttonMoveRight)
        
        buttonMoveRight.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonMoveRight.heightAnchor.constraint(equalToConstant:Constants.contentHeight).isActive = true
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
        buttonMoveLeft.imageView!.tintColor = self.highlightedColour
        self.buttonMoveLeft = buttonMoveLeft
        
        self.addSubview(buttonMoveLeft)
        
        buttonMoveLeft.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonMoveLeft.heightAnchor.constraint(equalToConstant:Constants.contentHeight).isActive = true
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
        buttonClose.imageView!.tintColor = self.highlightedColour
        self.buttonClose = buttonClose
        
        self.addSubview(buttonClose)
        
        buttonClose.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonClose.heightAnchor.constraint(equalToConstant:Constants.contentHeight).isActive = true
        buttonClose.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        buttonClose.widthAnchor.constraint(equalToConstant:Constants.buttonCloseWidth).isActive = true
    }
    
    private func addEdit() {
        let buttonEdit:UIButton = UIButton()
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        buttonEdit.setTitleColor(UIColor.white, for:UIControlState.normal)
        buttonEdit.setTitleColor(self.highlightedColour, for:UIControlState.highlighted)
        buttonEdit.setTitle(String.localizedLanding(key:"LandingViewCollectionMenu_buttonEdit"),
                            for:UIControlState())
        buttonEdit.titleLabel!.font = UIFont.systemFont(ofSize:Constants.buttonEditFontSize,
                                                        weight:UIFont.Weight.bold)
        self.buttonEdit = buttonEdit
        
        self.addSubview(buttonEdit)
        
        buttonEdit.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonEdit.heightAnchor.constraint(equalToConstant:Constants.contentHeight).isActive = true
        buttonEdit.widthAnchor.constraint(equalToConstant:Constants.buttonEditWidth).isActive = true
        self.layoutButtonEditLeft = buttonEdit.leftAnchor.constraint(equalTo:self.leftAnchor)
        self.layoutButtonEditLeft.isActive = true
    }
}
