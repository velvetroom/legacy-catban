import UIKit

public class ViewContent:UIView {
    weak var labelName:UILabel!
    
    public init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
    }
    
    private func makeOutlets() {
        let labelName:UILabel = UILabel()
        labelName.isUserInteractionEnabled = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.textColor = UIColor.black
        labelName.font = UIFont.systemFont(ofSize:ViewConstants.Name.fontSize, weight:UIFont.Weight.medium)
        self.labelName = labelName
        self.addSubview(labelName)
    }
    
    private func layoutOutlets() {
        self.labelName.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.labelName.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor,
                                             constant:ViewConstants.Name.left).isActive = true
        self.labelName.heightAnchor.constraint(equalToConstant:ViewConstants.Name.height).isActive = true
        self.labelName.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
}
