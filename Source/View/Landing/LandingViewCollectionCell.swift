import UIKit

class LandingViewCollectionCell:UICollectionViewCell {
    private(set) var labelTitle:UILabel!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
        self.addOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = UIColor(white:0, alpha:0.2).cgColor
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
