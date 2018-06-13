import UIKit
import Shared

class NamerViewStatus:UIImageView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func statusValid() {
        self.loadImage(name:NamerConstants.Status.assetValid)
        self.isHidden = false
    }
    
    func statusError() {
        self.loadImage(name:NamerConstants.Status.assetError)
        self.isHidden = false
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.contentMode = UIViewContentMode.center
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
    }
    
    private func loadImage(name:String) {
        self.image = UIImage(name:name, in:type(of:self))
    }
}
