import UIKit

class ViewColumn:ViewItem {
    var identifier:String
    private(set) weak var labelName:UILabel!
    
    override init() {
        self.identifier = String()
        super.init()
        self.dragState = DragStateFixed.self
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func triggerAction(canvas:CanvasEditorProtocol) {
        super.triggerAction(canvas:canvas)
        canvas.editColumnWith(identifier:self.identifier)
    }
    
    override func factoryOutlets() {
        self.factoryLabelName()
    }
    
    override func stateNormal() {
        super.stateNormal()
        self.alpha = Constants.ColumnTitle.alphaOff
    }
    
    override func stateHighlighted() {
        super.stateHighlighted()
        self.alpha = Constants.ColumnTitle.alphaOn
    }
    
    private func factoryLabelName() {
        let labelName:UILabel = UILabel()
        labelName.isUserInteractionEnabled = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.textColor = UIColor.black
        labelName.font = UIFont.systemFont(ofSize:Constants.ColumnTitle.fontSize, weight:UIFont.Weight.bold)
        self.labelName = labelName
        
        self.addSubview(labelName)
        
        labelName.topAnchor.constraint(
            equalTo:self.topAnchor, constant:Constants.ColumnTitle.labelTop).isActive = true
        labelName.leftAnchor.constraint(
            equalTo:self.leftAnchor, constant:Constants.ColumnTitle.labelLeft).isActive = true
        labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        labelName.heightAnchor.constraint(equalToConstant:Constants.ColumnTitle.labelHeight).isActive = true
    }
}
