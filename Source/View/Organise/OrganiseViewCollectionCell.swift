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
        self.factoryOutlets()
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
    
    private func factoryOutlets() {
        self.factoryLabelName()
        self.factoryImageSelect()
    }
    
    private func factoryLabelName() {
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
    
    private func factoryImageSelect() {
        let imageSelect:UIImageView = UIImageView()
        imageSelect.image = #imageLiteral(resourceName: "assetSelect")
        imageSelect.translatesAutoresizingMaskIntoConstraints = false
        imageSelect.isUserInteractionEnabled = false
        imageSelect.clipsToBounds = false
        imageSelect.contentMode = UIViewContentMode.center
        
        self.addSubview(imageSelect)
        
        imageSelect.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        imageSelect.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        imageSelect.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        imageSelect.widthAnchor.constraint(equalToConstant:Constants.selectWidth).isActive = true
    }
}
