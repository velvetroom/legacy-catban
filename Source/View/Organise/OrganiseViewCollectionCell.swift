import UIKit

class OrganiseViewCollectionCell:UICollectionViewCell {
    weak var labelName:UILabel?
    
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
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateState() {
        if self.isSelected || self.isHighlighted {
            self.backgroundColor = UIColor.Shared.blue
            self.labelName?.textColor = UIColor.white
        } else {
            self.backgroundColor = UIColor.white
            self.labelName?.textColor = UIColor.black
        }
    }
    
    private func factoryViews() {
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.font = UIFont.systemFont(ofSize:Constants.fontSize, weight:UIFont.Weight.regular)
        self.labelName = labelName
        
        self.addSubview(labelName)
        
        labelName.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        labelName.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        labelName.leftAnchor.constraint(equalTo:self.leftAnchor,
                                        constant:Constants.nameMarginLeft).isActive = true
        labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
}
