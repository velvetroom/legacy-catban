import UIKit
import Shared

class ViewMenuItem:UIButton {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var isSelected:Bool {
        didSet {
            self.updateState()
        }
    }
    
    override var isHighlighted:Bool {
        didSet {
            self.updateState()
        }
    }
    
    func addImage(name:String) {
        let image:UIImage = UIImage(name:name, in:type(of:self))
        self.setImage(image, for:UIControlState())
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView!.clipsToBounds = true
        self.imageView!.contentMode = UIViewContentMode.center
    }
    
    private func updateState() {
        if self.isHighlighted || self.isSelected {
            self.alpha = ViewConstants.MenuItem.alphaOn
        } else {
            self.alpha = ViewConstants.MenuItem.alphaOff
        }
    }
}
