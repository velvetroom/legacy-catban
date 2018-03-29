import UIKit

class LandingViewCollectionCellMenu:UIView {
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
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true
    }
    
    private func addOutlets() {
        self.addBackground()
    }
    
    private func addBackground() {
        let background:LandingViewCollectionCellMenuBackground = LandingViewCollectionCellMenuBackground()
        self.addSubview(background)
        
        background.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        background.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        background.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
