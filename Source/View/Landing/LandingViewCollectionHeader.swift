import UIKit

class LandingViewCollectionHeader:UICollectionReusableView {
    weak var delegate:LandingPresenterCollectionDataSourceProtocol?
    var section:Int
    private(set) weak var labelTitle:UILabel!
    private(set) weak var button:UIButton!
    
    override init(frame:CGRect) {
        self.section = 0
        super.init(frame:frame)
        self.configureView()
        self.addOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    @objc func selectorEdit(sender button:UIButton) {
        self.delegate?.editHeaderAt(index:self.section)
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.Shared.gray
        self.layer.cornerRadius = Constants.cornerRadius
    }
    
    private func addOutlets() {
        self.addTitle()
        self.addButton()
    }
    
    private func addTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor(red:0.6, green:0.65, blue:0.7, alpha:1)
        labelTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.bold)
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.titleTop).isActive = true
        labelTitle.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func addButton() {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(self.selectorEdit(sender:)), for:UIControlEvents.touchUpInside)
        self.button = button
        
        self.addSubview(button)
        
        button.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant:Constants.buttonHeight).isActive = true
        button.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
