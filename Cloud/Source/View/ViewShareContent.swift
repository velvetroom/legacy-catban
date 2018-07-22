import UIKit

class ViewShareContent:UIView {
    weak var viewImage:ViewShareImage!
    weak var viewBackground:ViewShareBackground!
    weak var viewBase:ViewShareBase!
    weak var viewBar:ViewShareBar!
    weak var buttonClose:UIButton!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.clear
    }
    
    private func makeOutlets() {
        self.makeBackground()
        self.makeClose()
        self.makeBase()
        self.makeImage()
        self.makeBar()
    }
    
    private func layoutOutlets() {
        self.layoutBackground()
        self.layoutClose()
        self.layoutBase()
        self.layoutImage()
        self.layoutBar()
    }
    
    private func makeBackground() {
        let viewBackground:ViewShareBackground = ViewShareBackground()
        self.viewBackground = viewBackground
        self.addSubview(viewBackground)
    }
    
    private func makeBase() {
        let viewBase:ViewShareBase = ViewShareBase()
        self.viewBase = viewBase
        self.addSubview(viewBase)
    }
    
    private func makeClose() {
        let buttonClose:UIButton = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        self.buttonClose = buttonClose
        self.addSubview(buttonClose)
    }
    
    private func makeImage() {
        let viewImage:ViewShareImage = ViewShareImage()
        self.viewImage = viewImage
        self.viewBase.addSubview(viewImage)
    }
    
    private func makeBar() {
        let viewBar:ViewShareBar = ViewShareBar()
        self.viewBar = viewBar
        self.addSubview(viewBar)
    }
    
    private func layoutBackground() {
        self.viewBackground.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewBackground.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.viewBackground.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBackground.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func layoutBase() {
        self.viewBase.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.viewBase.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBase.heightAnchor.constraint(equalToConstant:Constants.ShareBase.height).isActive = true
        self.viewBase.layoutTop = self.viewBase.topAnchor.constraint(equalTo:self.bottomAnchor)
        self.viewBase.layoutTop.isActive = true
    }
    
    private func layoutClose() {
        self.buttonClose.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.buttonClose.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.buttonClose.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.buttonClose.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func layoutImage() {
        self.viewImage.topAnchor.constraint(equalTo:self.viewBase.topAnchor).isActive = true
        self.viewImage.leftAnchor.constraint(equalTo:self.viewBase.leftAnchor).isActive = true
        self.viewImage.rightAnchor.constraint(equalTo:self.viewBase.rightAnchor).isActive = true
        self.viewImage.bottomAnchor.constraint(equalTo:self.viewBase.bottomAnchor).isActive = true
    }
    
    private func layoutBar() {
        self.viewBar.topAnchor.constraint(equalTo:self.viewBase.topAnchor).isActive = true
        self.viewBar.leftAnchor.constraint(equalTo:self.viewBase.leftAnchor).isActive = true
        self.viewBar.rightAnchor.constraint(equalTo:self.viewBase.rightAnchor).isActive = true
        self.viewBar.heightAnchor.constraint(equalToConstant:Constants.ShareBase.barHeight).isActive = true
    }
}
