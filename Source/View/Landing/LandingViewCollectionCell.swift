import UIKit

class LandingViewCollectionCell:UICollectionViewCell {
    private(set) weak var labelTitle:UILabel!
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
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
        self.addOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func configureState() {
        if self.isSelected || self.isHighlighted {
            self.configureSelected()
        } else {
            self.configureNotSelected()
        }
    }
    
    private func configureSelected() {
        self.backgroundColor = UIColor.blue
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureNotSelected() {
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(white:0, alpha:0.2).cgColor
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.borderWidth = Constants.borderWidth
    }
    
    private func addOutlets() {
        self.addTitle()
    }
    
    private func addTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textColor = UIColor.black
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.light)
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.titleMargin).isActive = true
        labelTitle.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.titleMargin).isActive = true
        labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor, constant:-Constants.titleMargin).isActive = true
    }
}
