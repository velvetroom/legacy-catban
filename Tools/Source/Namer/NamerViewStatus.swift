import UIKit
import Shared

class NamerViewStatus:UIView {
    weak var statusValid:UIImageView!
    weak var statusError:UIImageView!
    
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
        self.contentMode = UIViewContentMode.center
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
    }
    
    private func makeOutlets() {
        self.statusValid = self.makeImageWith(name:NamerConstants.Status.assetValid)
        self.statusError = self.makeImageWith(name:NamerConstants.Status.assetError)
    }
    
    private func layoutOutlets() {
        self.layout(image:self.statusValid)
        self.layout(image:self.statusError)
    }
    
    private func makeImageWith(name:String) -> UIImageView {
        let image:UIImageView = UIImageView()
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.center
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = false
        image.image = UIImage(name:name, in:type(of:self))
        self.addSubview(image)
        return image
    }
    
    private func layout(image:UIImageView) {
        image.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        image.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
