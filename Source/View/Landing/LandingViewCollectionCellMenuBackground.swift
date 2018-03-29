import UIKit

class LandingViewCollectionCellMenuBackground:UIVisualEffectView {
    init() {
        let visualEffect:UIBlurEffect = UIBlurEffect(style:UIBlurEffectStyle.light)
        super.init(effect:visualEffect)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = false
        self.addBorder()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func addBorder() {
        let border:UIView = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor(white:1, alpha:0.3)
        border.isUserInteractionEnabled = false
        self.contentView.addSubview(border)
        
        border.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        border.heightAnchor.constraint(equalToConstant:Constants.borderHeight).isActive = true
        border.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        border.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
