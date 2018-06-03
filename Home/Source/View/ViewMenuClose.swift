import UIKit
import Shared

class ViewMenuClose:UIButton {
    var layoutAlignRight:NSLayoutConstraint!
    var layoutCentre:NSLayoutConstraint!
    weak var icon:UIImageView!
    private let iconsOpen:[UIImage]
    private let iconsClose:[UIImage]
    
    init() {
        self.iconsOpen = ViewMenuCloseFactory.makeOpenAnimation()
        self.iconsClose = ViewMenuCloseFactory.makeCloseAnimation()
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    deinit {
        print("de init close")
    }
    
    func animateOpen() {
        self.icon.image = self.iconsOpen.last
        self.icon.animationImages = self.iconsOpen
        self.icon.startAnimating()
    }
    
    func animateClose() {
        self.icon.image = self.iconsClose.last
        self.icon.animationImages = self.iconsClose
        self.icon.startAnimating()
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func factoryViews() {
        let icon:UIImageView = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.animationRepeatCount = ViewConstants.Close.animationRepeat
        icon.animationDuration = ViewConstants.Close.animationDuration
        self.icon = icon
        
        self.addSubview(icon)
        
        icon.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        icon.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        icon.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        icon.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
