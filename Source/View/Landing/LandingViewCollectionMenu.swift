import UIKit

class LandingViewCollectionMenu:UIView {
    weak var buttonMoveRight:UIButton!
    weak var buttonMoveLeft:UIButton!
    weak var buttonClose:UIButton!
    weak var buttonEdit:UIButton!
    weak var layoutButtonEditLeft:NSLayoutConstraint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.addOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.Shared.blue
        self.clipsToBounds = true
    }
}
