import UIKit

extension LandingViewCollectionCell {
    override var isSelected:Bool {
        didSet {
            self.configureState()
        }
    }
    
    override var isHighlighted:Bool {
        didSet {
            self.configureState()
        }
    }
    
    func configureState() {
        if self.isSelected {
            self.configureSelected()
        } else {
            self.configureNotSelected()
        }
    }
    
    private func configureSelected() {
        self.labelTitle.textColor = UIColor.white
        self.backgroundColor = UIColor.Shared.blue
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureNotSelected() {
        self.labelTitle.textColor = UIColor.black
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
    }
}
