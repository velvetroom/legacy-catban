import UIKit
import Shared

class ViewColumn:ViewNode {
    private(set) weak var labelName:UILabel!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureViews()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.isUserInteractionEnabled = false
    }
    
    private func factoryOutlets() {
        self.factoryIcon()
        self.factoryLabelName()
    }
    
    private func factoryIcon() {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = UIViewContentMode.center
        icon.clipsToBounds = true
        icon.image = UIImage(name:ViewConstants.ColumnTitle.iconImage, in:type(of:self))
        
        self.addSubview(icon)
        
        icon.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.ColumnTitle.iconTop).isActive = true
        icon.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant:ViewConstants.ColumnTitle.iconWidth).isActive = true
        icon.heightAnchor.constraint(equalToConstant:ViewConstants.ColumnTitle.iconHeight).isActive = true
    }
    
    private func factoryLabelName() {
        let labelName:UILabel = UILabel()
        labelName.isUserInteractionEnabled = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.textColor = UIColor(white:0, alpha:ViewConstants.ColumnTitle.labelAlpha)
        labelName.font = UIFont.systemFont(ofSize:ViewConstants.ColumnTitle.fontSize, weight:UIFont.Weight.bold)
        self.labelName = labelName
        
        self.addSubview(labelName)
        
        labelName.topAnchor.constraint(
            equalTo:self.topAnchor, constant:ViewConstants.ColumnTitle.labelTop).isActive = true
        labelName.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.ColumnTitle.labelLeft).isActive = true
        labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelName.heightAnchor.constraint(equalToConstant:ViewConstants.ColumnTitle.labelHeight).isActive = true
    }
}
