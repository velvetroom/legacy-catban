import UIKit

class ViewNamerBase:UIView {
    weak var viewField:ViewNamerField!
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
        self.backgroundColor = UIColor.white
    }
    
    private func makeOutlets() {
        self.makeField()
        self.makeBorder()
    }
    
    private func layoutOutlets() {
        self.layoutField()
        self.layoutBorder()
    }
    
    private func makeField() {
        let viewField:ViewNamerField = ViewNamerField()
        self.viewField = viewField
        self.addSubview(viewField)
    }
    
    private func makeBorder() {
        let viewBorder:UIView = UIView()
        viewBorder.translatesAutoresizingMaskIntoConstraints = false
        viewBorder.isUserInteractionEnabled = false
        viewBorder.backgroundColor = UIColor.black
        self.viewBorder = viewBorder
        self.addSubview(viewBorder)
    }
    
    private func layoutField() {
        self.viewField.topAnchor.constraint(equalTo:self.topAnchor,
                                             constant:ViewConstants.NamerField.top).isActive = true
        self.viewField.leftAnchor.constraint(equalTo:self.leftAnchor,
                                           constant:ViewConstants.NamerField.left).isActive = true
        self.viewField.heightAnchor.constraint(equalToConstant:ViewConstants.NamerField.height).isActive = true
        self.viewField.widthAnchor.constraint(equalToConstant:ViewConstants.NamerField.width).isActive = true
    }
    
    private func layoutBorder() {
        self.viewBorder.topAnchor.constraint(equalTo:self.viewField.bottomAnchor).isActive = true
        self.viewBorder.leftAnchor.constraint(equalTo:self.viewField.leftAnchor).isActive = true
        self.viewBorder.widthAnchor.constraint(equalToConstant:ViewConstants.NamerField.width).isActive = true
        self.viewBorder.heightAnchor.constraint(equalToConstant:ViewConstants.NamerBorder.height).isActive = true
    }
}
