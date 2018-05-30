import UIKit

class ViewListSelector:UIView {
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
        self.isUserInteractionEnabled = false
    }
    
    private func factoryViews() {
        self.factoryTopBorder()
        self.factoryBottomBorder()
    }
    
    private func factoryTopBorder() {
        let border:UIView = self.factoryBorderView()
        border.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
    }
    
    private func factoryBottomBorder() {
        let border:UIView = self.factoryBorderView()
        border.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
    }
    
    private func factoryBorderView() -> UIView {
        let border:UIView = UIView()
        border.isUserInteractionEnabled = false
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor(white:0, alpha:0.5)
        self.addSubview(border)
        
        border.heightAnchor.constraint(equalToConstant:ViewConstants.ListSelector.borderWidth).isActive = true
        border.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        border.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        return border
    }
}
