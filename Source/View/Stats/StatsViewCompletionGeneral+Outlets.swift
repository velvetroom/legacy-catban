import UIKit

extension StatsViewCompletionGeneral {
    func factoryOutlets() {
        self.factoryCardsTitle()
        self.factoryCardsNumber()
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
        
        label.heightAnchor.constraint(equalToConstant:Constants.cardsNumberHeight).isActive = true
        label.topAnchor.constraint(equalTo:self.labelCardsTitle.bottomAnchor).isActive = true
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
        label.text = String.localizedStats(key:"StatsViewCompletionGeneral_cardsTitle")
        self.labelCardsTitle = label
        
        self.addSubview(label)
        
        label.heightAnchor.constraint(equalToConstant:Constants.cardsTitleHeight).isActive = true
        label.bottomAnchor.constraint(equalTo:self.centerYAnchor,
                                      constant:Constants.cardsTitleBottom).isActive = true
        label.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
