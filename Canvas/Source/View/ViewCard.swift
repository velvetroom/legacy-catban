import UIKit

class ViewCard:ViewItem {
    var identifier:String
    private(set) weak var labelContent:UILabel!
    
    override init() {
        self.identifier = String()
        super.init()
        self.dragState = DragStateDynamic.self
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func triggerAction(canvas:CanvasEditorProtocol) {
        super.triggerAction(canvas:canvas)
        canvas.editCardWith(identifier:self.identifier)
    }
    
    override func stateHighlighted() {
        super.stateHighlighted()
        UIView.animate(withDuration:Constants.Generic.animationDuration) { [weak self] in
            self?.backgroundColor = UIColor.Shared.blue
            self?.labelContent.textColor = UIColor.white
        }
    }
    
    override func stateNormal() {
        super.stateNormal()
        UIView.animate(withDuration:Constants.Generic.animationDuration) { [weak self] in
            self?.backgroundColor = UIColor.white
            self?.labelContent.textColor = UIColor.black
        }
    }
    
    override func factoryOutlets() {
        super.factoryOutlets()
        self.factoryLabel()
        self.configureView()
    }
    
    private func factoryLabel() {
        let labelContent:UILabel = UILabel()
        labelContent.isUserInteractionEnabled = false
        labelContent.translatesAutoresizingMaskIntoConstraints = false
        labelContent.backgroundColor = UIColor.clear
        labelContent.numberOfLines = 0
        labelContent.font = UIFont.systemFont(ofSize:Constants.Card.fontSize, weight:UIFont.Weight.regular)
        self.labelContent = labelContent
        
        self.addSubview(labelContent)
        
        labelContent.topAnchor.constraint(equalTo:self.topAnchor,
                                          constant:Constants.Card.contentPadding).isActive = true
        labelContent.bottomAnchor.constraint(equalTo:self.bottomAnchor,
                                             constant:-Constants.Card.contentPadding).isActive = true
        labelContent.leftAnchor.constraint(equalTo:self.leftAnchor,
                                           constant:Constants.Card.contentPadding).isActive = true
        labelContent.rightAnchor.constraint(equalTo:self.rightAnchor,
                                            constant:-Constants.Card.contentPadding).isActive = true
    }
    
    private func configureView() {
        self.layer.cornerRadius = Constants.Card.cornerRadius
        self.stateNormal()
    }
}