import UIKit

class StatsViewCompletionGeneral:UIView {
    private(set) weak var labelCardsNumber:UILabel!
    private(set) weak var labelCardsTitle:UILabel!
    
    init() {
        super.init(frame:CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
        self.clipsToBounds = true
        self.factoryOutlets()
        self.labelCardsTitle.text = "Cards"
        self.labelCardsNumber.text = "454"
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func factoryOutlets() {
        self.factoryCardsNumber()
        self.factoryCardsTitle()
    }
    
    private func factoryCardsNumber() {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize:Constants.cardsNumberFontSize, weight:UIFont.Weight.light)
        self.labelCardsNumber = label
        
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func factoryCardsTitle() {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor(white:0, alpha:0.5)
        label.font = UIFont.systemFont(ofSize:Constants.cardsTitleFontSize, weight:UIFont.Weight.light)
        self.labelCardsTitle = label
        
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.cardsTitleTop).isActive = true
        label.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
