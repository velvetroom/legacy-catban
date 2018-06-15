import UIKit

class NamerViewContent:UIView {
    weak var viewField:NamerViewField!
    weak var viewStatus:NamerViewStatus!
    weak var viewBorder:UIView!
    weak var labelMessage:UILabel!
    
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
        self.backgroundColor = UIColor.white
    }
    
    private func makeOutlets() {
        self.makeField()
        self.makeBorder()
        self.makeStatus()
        self.makerError()
    }
    
    private func layoutOutlets() {
        self.layoutField()
        self.layoutBorder()
        self.layoutStatus()
        self.layoutError()
    }
    
    private func makeField() {
        let viewField:NamerViewField = NamerViewField()
        self.viewField = viewField
        self.addSubview(viewField)
    }
    
    private func makeBorder() {
        let viewBorder:UIView = UIView()
        viewBorder.translatesAutoresizingMaskIntoConstraints = false
        viewBorder.isUserInteractionEnabled = false
        viewBorder.backgroundColor = UIColor.black
        self.viewBorder = viewBorder
        self.addSubview(viewBorder)
    }
    
    private func makeStatus() {
        let viewStatus:NamerViewStatus = NamerViewStatus()
        self.viewStatus = viewStatus
        self.addSubview(viewStatus)
    }
    
    private func makerError() {
        let labelMessage:UILabel = UILabel()
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        labelMessage.backgroundColor = UIColor.clear
        labelMessage.isUserInteractionEnabled = false
        labelMessage.font = UIFont.systemFont(ofSize:NamerConstants.Error.fontSize, weight:UIFont.Weight.regular)
        labelMessage.numberOfLines = 0
        labelMessage.textColor = UIColor(white:0, alpha:0.5)
        self.labelMessage = labelMessage
        self.addSubview(labelMessage)
    }
    
    private func layoutField() {
        self.viewField.topAnchor.constraint(equalTo:self.topAnchor, constant:NamerConstants.Field.top).isActive = true
        self.viewField.heightAnchor.constraint(equalToConstant:NamerConstants.Field.height).isActive = true
        self.viewField.widthAnchor.constraint(equalToConstant:NamerConstants.Field.width).isActive = true
        self.viewField.leftAnchor.constraint(equalTo:self.leftAnchor,
                                             constant:NamerConstants.Field.left).isActive = true
    }
    
    private func layoutBorder() {
        self.viewBorder.topAnchor.constraint(equalTo:self.viewField.bottomAnchor).isActive = true
        self.viewBorder.leftAnchor.constraint(equalTo:self.viewField.leftAnchor).isActive = true
        self.viewBorder.widthAnchor.constraint(equalToConstant:NamerConstants.Field.width).isActive = true
        self.viewBorder.heightAnchor.constraint(equalToConstant:NamerConstants.Border.height).isActive = true
    }
    
    private func layoutStatus() {
        self.viewStatus.widthAnchor.constraint(equalToConstant:NamerConstants.Status.size).isActive = true
        self.viewStatus.heightAnchor.constraint(equalToConstant:NamerConstants.Status.size).isActive = true
        self.viewStatus.leftAnchor.constraint(equalTo:self.viewField.rightAnchor).isActive = true
        self.viewStatus.centerYAnchor.constraint(equalTo:self.viewField.centerYAnchor).isActive = true
    }
    
    private func layoutError() {
        self.labelMessage.leftAnchor.constraint(equalTo:self.viewBorder.leftAnchor).isActive = true
        self.labelMessage.rightAnchor.constraint(equalTo:self.viewStatus.rightAnchor).isActive = true
        self.labelMessage.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.labelMessage.topAnchor.constraint(equalTo:self.viewBorder.bottomAnchor,
                                             constant:NamerConstants.Error.top).isActive = true
    }
}
