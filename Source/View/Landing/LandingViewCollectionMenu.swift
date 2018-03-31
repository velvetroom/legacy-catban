import UIKit

class LandingViewCollectionMenu:UIView {
    weak var buttonMoveRight:UIButton!
    weak var buttonMoveLeft:UIButton!
    
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
