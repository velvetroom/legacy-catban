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
    
    override var isSelected:Bool {
        didSet {
            self.updateState()
        }
    }
    
    override var isHighlighted:Bool {
        didSet {
            self.updateState()
        }
    }
    
    func updateState() {
        if self.isSelected || self.isHighlighted {
            self.showOn()
        } else {
            self.showOff()
        }
    }
    
    private func configureView() {
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clear
    }
    
    private func factoryViews() {
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.clipsToBounds = false
        self.labelName = labelName
        self.addSubview(labelName)
        
        labelName.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        labelName.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.ListItem.horizontalPadding).isActive = true
        labelName.rightAnchor.constraint(
            lessThanOrEqualTo:self.rightAnchor, constant:-ViewConstants.ListItem.horizontalPadding).isActive = true
        labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelName.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func showOn() {
        self.labelName.textColor = UIColor.black
        self.labelName.font = UIFont.systemFont(ofSize:ViewConstants.ListItem.fontSizeOn, weight:UIFont.Weight.medium)
    }
    
    private func showOff() {
        self.labelName.textColor = UIColor(white:0, alpha:0.25)
        self.labelName.font = UIFont.systemFont(ofSize:ViewConstants.ListItem.fontSizeOff, weight:UIFont.Weight.regular)
    }
}
