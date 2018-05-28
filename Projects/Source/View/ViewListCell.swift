import UIKit

class ViewListCell:UICollectionViewCell {
    weak var labelName:UILabel!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
    }
    
    private func factoryViews() {
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.textColor = UIColor.black
        labelName.font = UIFont.monospacedDigitSystemFont(
            ofSize:ViewConstants.ListItem.fontSize, weight:UIFont.Weight.medium)
        self.labelName = labelName
        self.addSubview(labelName)
        
        labelName.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        labelName.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        labelName.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.ListItem.nameLeft).isActive = true
        labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
}
