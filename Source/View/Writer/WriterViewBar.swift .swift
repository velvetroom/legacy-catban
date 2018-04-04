import UIKit

class WriterViewBar:UIView {
    private(set) var buttonDone:UIButton!
    private(set) var layoutDoneLeft:NSLayoutConstraint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.Shared.gray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func layoutSubviews() {
        let remainWidth:CGFloat = self.bounds.width - Constants.doneWidth
        let marginLeft:CGFloat = remainWidth / 2.0
        self.layoutDoneLeft.constant = marginLeft
        super.layoutSubviews()
    }
    
    private func factoryOutlets() {
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.setTitle(String.localizedWriter(key:"WriterViewBar_buttonDone"), for:UIControlState.normal)
        buttonDone.setTitleColor(UIColor.Shared.blue, for:UIControlState.normal)
        buttonDone.setTitleColor(UIColor.white, for:UIControlState.highlighted)
        buttonDone.titleLabel!.font = UIFont.systemFont(ofSize:Constants.doneFontSize, weight:UIFont.Weight.medium)
        self.buttonDone = buttonDone
        
        self.addSubview(buttonDone)
        
        buttonDone.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        buttonDone.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        buttonDone.widthAnchor.constraint(equalToConstant:Constants.doneWidth).isActive = true
        self.layoutDoneLeft = buttonDone.leftAnchor.constraint(equalTo:self.leftAnchor)
        self.layoutDoneLeft.isActive = true
    }
}
