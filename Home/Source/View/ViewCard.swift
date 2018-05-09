import UIKit

class ViewCard:UIView {
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutHeight:NSLayoutConstraint!
    weak var layoutWidth:NSLayoutConstraint!
    private(set) weak var labelContent:UILabel!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func factoryOutlets() {
        self.factoryLabel()
    }
    
    private func factoryLabel() {
        let labelContent:UILabel = UILabel()
        labelContent.isUserInteractionEnabled = false
        labelContent.translatesAutoresizingMaskIntoConstraints = false
        labelContent.backgroundColor = UIColor.clear
        labelContent.numberOfLines = 0
        labelContent.font = UIFont.systemFont(ofSize:ViewConstants.Card.fontSize, weight:UIFont.Weight.regular)
        labelContent.textColor = UIColor.black
        self.labelContent = labelContent
        
        self.addSubview(labelContent)
        
        labelContent.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        labelContent.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        labelContent.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        labelContent.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
