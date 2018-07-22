import UIKit

class ViewShareBase:UIView {
    weak var viewBorder:UIView!
    weak var layoutTop:NSLayoutConstraint!
    
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
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
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
        viewBorder.backgroundColor = UIColor.black
        viewBorder.isUserInteractionEnabled = false
        self.viewBorder = viewBorder
        self.addSubview(viewBorder)
    }
    
    private func layoutBorder() {
        self.viewBorder.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewBorder.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBorder.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.viewBorder.heightAnchor.constraint(equalToConstant:Constants.ShareBase.borderHeight).isActive = true
    }
}
