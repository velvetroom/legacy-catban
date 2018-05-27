import UIKit

class ViewMenu:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func factoryViews() {
        self.factoryBorder()
    }
    
    private func factoryBorder() {
        let border:UIView = UIView()
        border.isUserInteractionEnabled = false
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor(white:0, alpha:0.2)
        self.addSubview(border)
        
        border.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        border.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:ViewConstants.Menu.borderMargin).isActive = true
        border.rightAnchor.constraint(
            equalTo:self.rightAnchor, constant:-ViewConstants.Menu.borderMargin).isActive = true
        border.heightAnchor.constraint(equalToConstant:ViewConstants.Menu.borderWidth).isActive = true
    }
}
