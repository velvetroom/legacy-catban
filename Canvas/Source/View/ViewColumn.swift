import UIKit
import Shared

class ViewColumn:ViewNode {
    private(set) weak var labelName:UILabel!
    
    override func factoryOutlets() {
        self.factoryIcon()
        self.factoryLabelName()
    }
    
    private func factoryIcon() {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = UIViewContentMode.center
        icon.clipsToBounds = true
        icon.image = UIImage(name:Constants.ColumnTitle.icon, in:type(of:self))
        
        self.addSubview(icon)
        
        icon.topAnchor.constraint(
            equalTo:self.topAnchor, constant:Constants.ColumnTitle.iconTop).isActive = true
        icon.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant:Constants.ColumnTitle.iconWidth).isActive = true
        icon.heightAnchor.constraint(equalToConstant:Constants.ColumnTitle.iconHeight).isActive = true
    }
    
    private func factoryLabelName() {
        let labelName:UILabel = UILabel()
        labelName.isUserInteractionEnabled = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.textColor = UIColor(white:0, alpha:Constants.ColumnTitle.labelAlpha)
        labelName.font = UIFont.systemFont(ofSize:Constants.ColumnTitle.fontSize, weight:UIFont.Weight.bold)
        self.labelName = labelName
        
        self.addSubview(labelName)
        
        labelName.topAnchor.constraint(
            equalTo:self.topAnchor, constant:Constants.ColumnTitle.labelTop).isActive = true
        labelName.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:Constants.ColumnTitle.labelLeft).isActive = true
        labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelName.heightAnchor.constraint(equalToConstant:Constants.ColumnTitle.labelHeight).isActive = true
    }
}
