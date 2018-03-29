import UIKit

extension LandingViewCollectionCell {
    func addOutlets() {
        self.addTitle()
        self.addMenu()
    }
    
    private func addTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.light)
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.titleMargin).isActive = true
        labelTitle.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.titleMargin).isActive = true
        labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor, constant:-Constants.titleMargin).isActive = true
    }
    
    private func addMenu() {
        let viewMenu:LandingViewCollectionCellMenu = LandingViewCollectionCellMenu()
        self.viewMenu = viewMenu
        
        self.addSubview(viewMenu)
        
        viewMenu.heightAnchor.constraint(equalToConstant:Constants.menuHeight).isActive = true
        viewMenu.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewMenu.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewMenu.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
