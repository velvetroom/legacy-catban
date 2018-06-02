import UIKit
import Shared

class ViewNewColumn:ViewItem {
    override init() {
        super.init()
        self.dragState = DragStateFixed.self
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func triggerAction(canvas:CanvasEditorProtocol) {
        super.triggerAction(canvas:canvas)
        canvas.createNewColumn()
    }
    
    override func stateHighlighted() {
        super.stateHighlighted()
        self.alpha = Constants.NewColumn.alphaOn
    }
    
    override func stateNormal() {
        super.stateNormal()
        self.alpha = Constants.NewColumn.alphaOff
    }
    
    override func factoryOutlets() {
        super.factoryOutlets()
        let image:UIImageView = UIImageView()
        image.image = UIImage(name:Constants.NewColumn.icon, in:type(of:self))
        image.isUserInteractionEnabled = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.center
        image.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(image)
        
        image.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        image.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
