import UIKit

class ViewShareBar:UIToolbar {
    weak var viewBorder:UIView!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = false
        self.backgroundColor = UIColor.white
        self.barStyle = UIBarStyle.default
        self.barTintColor = UIColor.white
        self.tintColor = UIColor.black
        self.isTranslucent = false
    }
    
    private func makeOutlets() {
        self.makeBorder()
    }
    
    private func layoutOutlets() {
        self.layoutBorder()
    }
    
    private func makeBorder() {
        let viewBorder:UIView = UIView()
        viewBorder.translatesAutoresizingMaskIntoConstraints = false
        viewBorder.backgroundColor = UIColor(white:0, alpha:0.2)
        viewBorder.isUserInteractionEnabled = false
        self.viewBorder = viewBorder
        self.addSubview(viewBorder)
    }
    
    private func layoutBorder() {
        self.viewBorder.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.viewBorder.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBorder.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.viewBorder.heightAnchor.constraint(equalToConstant:Constants.ShareBase.borderHeight).isActive = true
    }
}
