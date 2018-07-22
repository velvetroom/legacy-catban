import UIKit
import Shared

class ViewMenuOptions:UIView {
    weak var closeButton:UIButton!
    weak var optionCloud:ViewMenuOption!
    weak var optionProjects:ViewMenuOption!
    weak var optionAbout:ViewMenuOption!
    weak var layoutRootTop:NSLayoutConstraint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func animateOpen() {
        let deadline:DispatchTime = DispatchTime.now() + ViewConstants.Background.animationDuration
        DispatchQueue.main.asyncAfter(deadline:deadline) { [weak self] in
            self?.animateAfterDelay()
        }
    }
    
    func animateClose() {
        self.layoutRootTop.constant = ViewConstants.Options.rootTopClose
        self.animateWith(alpha:ViewConstants.Options.alphaClose)
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = ViewConstants.Options.alphaClose
    }
    
    private func makeOutlets() {
        self.makeCloseButton()
        self.makeOptions()
    }
    
    private func layoutOutlets() {
        self.layoutCloseButton()
        self.layoutOptions()
    }
    
    private func makeCloseButton() {
        let closeButton:UIButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton = closeButton
        self.addSubview(closeButton)
    }
    
    private func animateAfterDelay() {
        self.layoutRootTop.constant = ViewConstants.Options.rootTopOpen
        self.animateWith(alpha:ViewConstants.Options.alphaOpen)
    }
    
    private func animateWith(alpha:CGFloat) {
        UIView.animate(withDuration:ViewConstants.Options.animationDuration) { [weak self] in
            self?.alpha = alpha
            self?.layoutIfNeeded()
        }
    }

    private func layoutCloseButton() {
        self.closeButton.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.closeButton.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.closeButton.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.closeButton.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
