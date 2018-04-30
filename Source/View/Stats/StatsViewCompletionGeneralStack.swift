import UIKit

class StatsViewCompletionGeneralStack:UIView {
    weak var labelNumber:UILabel!
    weak var labelTitle:UILabel!
    weak var viewColour:UIView!
    weak var layoutHeight:NSLayoutConstraint?
    
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func factoryOutlets() {
        self.factoryViewColour()
        self.factoryLabelNumber()
        self.factoryLabelTitle()
    }
    
    private func factoryViewColour() {
        let view:UIView = UIView()
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = Constants.viewColourCornerRadius
        self.viewColour = view
        
        self.addSubview(view)
        
        view.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant:Constants.viewColourSize).isActive = true
        view.heightAnchor.constraint(equalToConstant:Constants.viewColourSize).isActive = true
        view.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.viewColourLeft).isActive = true
    }
    
    private func factoryLabelNumber() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize:Constants.labelNumberFontSize, weight:UIFont.Weight.regular)
        label.textColor = UIColor.black
        self.labelNumber = label
        
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        label.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        label.leftAnchor.constraint(equalTo:self.viewColour.rightAnchor,
                                    constant:Constants.labelNumberLeft).isActive = true
    }
    
    private func factoryLabelTitle() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize:Constants.labelTitleFontSize, weight:UIFont.Weight.light)
        label.textColor = UIColor(white:0, alpha:0.6)
        self.labelTitle = label
        
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        label.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        label.leftAnchor.constraint(equalTo:self.labelNumber.rightAnchor,
                                    constant:Constants.labelTitleLeft).isActive = true
    }
}
