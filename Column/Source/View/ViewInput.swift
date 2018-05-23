import UIKit

class ViewInput:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func factoryOutlets() {
        self.factoryTitle()
        self.factoryLine()
    }
    
    private func factoryTitle() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize:ViewConstants.Title.fontSize, weight:UIFont.Weight.medium)
        label.text = String.localized(key:"ViewInput_titleLabel", in:type(of:self))
        
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant:ViewConstants.Title.height).isActive = true
        label.widthAnchor.constraint(equalToConstant:ViewConstants.Title.width).isActive = true
        label.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
    
    private func factoryLine() {
        let line:UIView = UIView()
        line.isUserInteractionEnabled = false
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(white:0.9, alpha:1)
        
        self.addSubview(line)
        
        line.topAnchor.constraint(equalTo:self.topAnchor, constant:ViewConstants.Line.top).isActive = true
        line.heightAnchor.constraint(equalToConstant:ViewConstants.Line.height).isActive = true
        line.widthAnchor.constraint(equalToConstant:ViewConstants.Line.width).isActive = true
        line.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
}
