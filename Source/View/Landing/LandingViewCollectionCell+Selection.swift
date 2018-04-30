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
        self.buttonDelete.isHidden = false
    }
    
    private func configureNotSelected() {
        self.labelTitle.textColor = UIColor.black
        self.backgroundColor = UIColor.white
        self.buttonDelete.isHidden = true
    }
}
