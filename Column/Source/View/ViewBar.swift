import UIKit
import Shared

class ViewBar:UIView {
    private(set) weak var deleteButton:UIButton!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func factoryOutlets() {
        let icon:UIImage = UIImage(name:ViewConstants.Delete.icon, in:type(of:self))
        let deleteButton:UIButton = UIButton()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setImage(icon, for:UIControlState.normal)
        deleteButton.imageView!.clipsToBounds = true
        deleteButton.imageView!.contentMode = UIViewContentMode.center
        self.deleteButton = deleteButton
        
        self.addSubview(deleteButton)
        
        deleteButton.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        deleteButton.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant:ViewConstants.Delete.width).isActive = true
    }
}
