import UIKit
import Shared

class ViewMenuOption:UIButton {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func loadIcon(name:String) {
        let image:UIImage = UIImage(name:name, in:type(of:self))
        self.setImage(image, for:UIControlState.normal)
        self.setImage(image.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for:UIControlState.highlighted)
    }
    
    func layoutSize() {
        self.widthAnchor.constraint(equalToConstant:ViewConstants.Option.size).isActive = true
        self.heightAnchor.constraint(equalToConstant:ViewConstants.Option.size).isActive = true
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView!.contentMode = UIViewContentMode.center
        self.imageView!.clipsToBounds = true
        self.imageView!.tintColor = UIColor(white:0, alpha:0.2)
    }
}
