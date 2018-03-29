import UIKit

class LandingViewCollectionMenu:UIView {
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
    
    private func addOutlets() {
        self.addBorder()
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
}
