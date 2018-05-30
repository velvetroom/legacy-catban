import UIKit

class ViewRenamer:UIView {
    weak var doneButton:UIButton!
    weak var viewInput:ViewRenamerInput!
    weak var layoutBottom:NSLayoutConstraint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.isUserInteractionEnabled = false
        self.alpha = ViewConstants.Renamer.alphaOff
    }
    
    private func factoryViews() {
        self.factoryBlur()
        self.factoryCancelButton()
        self.factoryInput()
    }
    
    private func factoryBlur() {
        let effect:UIBlurEffect = UIBlurEffect(style:UIBlurEffectStyle.light)
        let blur:UIVisualEffectView = UIVisualEffectView(effect:effect)
        blur.isUserInteractionEnabled = false
        blur.translatesAutoresizingMaskIntoConstraints = false
        blur.clipsToBounds = true
        
        self.addSubview(blur)
        
        blur.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        blur.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        blur.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        blur.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func factoryCancelButton() {
        let doneButton:UIButton = UIButton()
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        self.doneButton = doneButton
        self.addSubview(doneButton)
        
        doneButton.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        doneButton.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        doneButton.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func factoryInput() {
        let viewInput:ViewRenamerInput = ViewRenamerInput()
        self.viewInput = viewInput
        self.addSubview(viewInput)
        
        self.layoutBottom = viewInput.bottomAnchor.constraint(equalTo:self.bottomAnchor)
        self.layoutBottom.isActive = true
        viewInput.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewInput.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        viewInput.heightAnchor.constraint(equalToConstant:ViewConstants.RenamerInput.height).isActive = true
    }
}
