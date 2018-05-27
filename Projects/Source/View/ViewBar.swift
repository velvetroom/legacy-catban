import UIKit
import Shared

class ViewBar:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func factoryViews() {
        self.factoryBorder()
        self.factoryTitle()
    }
    
    private func factoryTitle() {
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textColor = UIColor.black
        labelTitle.font = UIFont.systemFont(ofSize:ViewConstants.BarTitle.fontSize, weight:UIFont.Weight.bold)
        labelTitle.text = String.localized(key:"ViewBar_title", in:type(of:self))
        self.addSubview(labelTitle)
        
        labelTitle.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        labelTitle.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.BarTitle.left).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant:ViewConstants.BarTitle.height).isActive = true
        labelTitle.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func factoryBorder() {
        let border:UIView = UIView()
        border.isUserInteractionEnabled = false
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor.black
        self.addSubview(border)
        
        border.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        border.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        border.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        border.heightAnchor.constraint(equalToConstant:ViewConstants.Bar.borderWidth).isActive = true
    }
}
