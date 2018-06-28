import UIKit
import Shared

class ViewMenuOption:UIButton {
    weak var nameLabel:UILabel!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
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
    
    func load(icon:String) {
        let image:UIImage = UIImage(name:icon, in:type(of:self))
        self.setImage(image, for:UIControlState.normal)
        self.setImage(image.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for:UIControlState.highlighted)
    }
    
    private func updateState() {
        if self.isSelected || self.isHighlighted {
            self.nameLabel.alpha = ViewConstants.Option.alphaOn
        } else {
            self.nameLabel.alpha = ViewConstants.Option.alphaOff
        }
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView!.contentMode = UIViewContentMode.center
        self.imageView!.clipsToBounds = true
        self.imageView!.tintColor = UIColor(white:0, alpha:0.2)
    }
    
    private func makeOutlets() {
        let nameLabel:UILabel = UILabel()
        nameLabel.isUserInteractionEnabled = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.backgroundColor = UIColor.clear
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize:ViewConstants.Option.fontSize, weight:UIFont.Weight.medium)
        self.nameLabel = nameLabel
        self.addSubview(nameLabel)
    }
    
    private func layoutOutlets() {
        self.nameLabel.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant:ViewConstants.Option.nameHeight).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.nameLabel.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
