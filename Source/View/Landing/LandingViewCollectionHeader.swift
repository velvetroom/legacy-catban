import UIKit

class LandingViewCollectionHeader:UICollectionReusableView {
    private(set) var labelTitle:UILabel!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor(white:0.9, alpha:1)
        self.addTitle()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func addTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor(white:0.2, alpha:1)
        labelTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.light)
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.titleTop).isActive = true
        labelTitle.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
