import UIKit

class ViewColumn:UIView {
    weak var labelName:UILabel!
    weak var layoutLeft:NSLayoutConstraint!
    
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
        self.factoryLabelTitle()
    }
    
    private func factoryLabelTitle() {
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
