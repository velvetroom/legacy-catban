import UIKit

extension LandingViewCollectionCell {
    func addOutlets() {
        self.addTitle()
        self.addDelete()
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
        labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor,
                                         constant:Constants.titleMarginLeft).isActive = true
        labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor,
                                          constant:-Constants.titleMarginLeft).isActive = true
    }
    
    private func addDelete() {
        let buttonDelete:UIButton = UIButton()
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.setImage(#imageLiteral(resourceName: "assetDelete"), for:UIControlState.normal)
        buttonDelete.setImage(#imageLiteral(resourceName: "assetDelete"), for:UIControlState.highlighted)
        buttonDelete.imageView!.clipsToBounds = true
        buttonDelete.imageView!.contentMode = UIViewContentMode.center
        self.buttonDelete = buttonDelete
        
        self.addSubview(buttonDelete)
        
        buttonDelete.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.deleteMargin).isActive = true
        buttonDelete.heightAnchor.constraint(equalToConstant:Constants.deleteSize).isActive = true
        buttonDelete.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.deleteMargin).isActive = true
        buttonDelete.widthAnchor.constraint(equalToConstant:Constants.deleteSize).isActive = true
    }
}
