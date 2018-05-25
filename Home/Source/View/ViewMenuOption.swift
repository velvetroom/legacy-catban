import UIKit
import Shared

class ViewMenuOption:UIButton {
    weak var nameLabel:UILabel!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
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
    
    private func factoryViews() {
        let nameLabel:UILabel = UILabel()
        nameLabel.isUserInteractionEnabled = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.backgroundColor = UIColor.clear
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize:ViewConstants.Option.fontSize, weight:UIFont.Weight.medium)
        self.nameLabel = nameLabel
        
        self.addSubview(nameLabel)
        
        nameLabel.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant:ViewConstants.Option.nameHeight).isActive = true
        nameLabel.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func updateState() {
        if self.isSelected || self.isHighlighted {
            self.nameLabel.alpha = ViewConstants.Option.alphaOn
        } else {
            self.nameLabel.alpha = ViewConstants.Option.alphaOff
        }
    }
}
