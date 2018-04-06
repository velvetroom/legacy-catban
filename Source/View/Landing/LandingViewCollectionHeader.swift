import UIKit

class LandingViewCollectionHeader:UICollectionReusableView {
    private(set) weak var labelTitle:UILabel!
    
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
        self.backgroundColor = UIColor.Shared.gray
        self.layer.cornerRadius = Constants.cornerRadius
    }
    
    private func addOutlets() {
        self.addTitle()
    }
    
    private func addTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor(red:0.6, green:0.65, blue:0.7, alpha:1)
        labelTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.bold)
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.titleTop).isActive = true
        labelTitle.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
