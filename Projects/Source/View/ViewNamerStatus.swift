import UIKit
import Shared

class ViewNamerStatus:UIImageView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func statusValid() {
        self.loadImage(name:ViewConstants.NamerStatus.assetValid)
    }
    
    func statusError() {
        self.loadImage(name:ViewConstants.NamerStatus.assetError)
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
