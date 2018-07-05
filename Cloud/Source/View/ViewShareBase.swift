import UIKit
import Shared

class ViewShareBase:UIView {
    weak var viewBorder:UIView!
    weak var buttonDone:UIButton!
    weak var layoutTop:NSLayoutConstraint!
    
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
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
    }
    
    private func makeOutlets() {
        self.makeBorder()
        self.makeDone()
    }
    
    private func layoutOutlets() {
        self.layoutBorder()
        self.layoutDone()
    }
    
    private func makeBorder() {
        let viewBorder:UIView = UIView()
        viewBorder.translatesAutoresizingMaskIntoConstraints = false
        viewBorder.backgroundColor = UIColor.black
        viewBorder.isUserInteractionEnabled = false
        self.viewBorder = viewBorder
        self.addSubview(viewBorder)
    }
    
    private func makeDone() {
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.setTitleColor(UIColor.black, for:UIControlState.normal)
        buttonDone.setTitleColor(UIColor(white:0, alpha:0.2), for:UIControlState.highlighted)
        buttonDone.setTitle(String.localized(key:"ViewShareBase_ButtonDone", in:type(of:self)), for:UIControlState())
        buttonDone.titleLabel!.font = UIFont.systemFont(ofSize:ViewConstants.ShareDone.fontSize,
                                                        weight:UIFont.Weight.bold)
        self.buttonDone = buttonDone
        self.addSubview(buttonDone)
    }
    
    private func layoutBorder() {
        self.viewBorder.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewBorder.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewBorder.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.viewBorder.heightAnchor.constraint(equalToConstant:ViewConstants.ShareBase.borderHeight).isActive = true
    }
    
    private func layoutDone() {
        self.buttonDone.bottomAnchor.constraint(equalTo:self.bottomAnchor,
                                                constant:ViewConstants.ShareDone.bottom).isActive = true
        self.buttonDone.widthAnchor.constraint(equalToConstant:ViewConstants.ShareDone.width).isActive = true
        self.buttonDone.heightAnchor.constraint(equalToConstant:ViewConstants.ShareDone.height).isActive = true
        self.buttonDone.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
}
