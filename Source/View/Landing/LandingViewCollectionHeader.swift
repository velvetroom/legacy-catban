import UIKit

class LandingViewCollectionHeader:UICollectionReusableView {
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
        self.clipsToBounds = true
        self.backgroundColor = UIColor(white:0.95, alpha:1)
        self.layer.cornerRadius = Constants.cornerRadius
    }
    
    private func addOutlets() {
        self.addTitle()
        self.addBorder()
    }
    
    private func addTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor(white:0.7, alpha:1)
        labelTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.bold)
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.titleTop).isActive = true
        labelTitle.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func addBorder() {
        let border:UIView = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.isUserInteractionEnabled = false
        border.backgroundColor = UIColor(white:0.85, alpha:1)
        self.addSubview(border)
        
        border.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.borderTop).isActive = true
        border.heightAnchor.constraint(equalToConstant:Constants.borderHeight).isActive = true
        border.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        border.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
