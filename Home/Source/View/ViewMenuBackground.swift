import UIKit

class ViewMenuBackground:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryBlur()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func animateOpen() {
        self.animateWith(alpha:ViewConstants.Background.alphaOpen)
    }
    
    func animateClose() {
        self.animateWith(alpha:ViewConstants.Background.alphaClose)
    }
    
    private func configureView() {
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.alpha = 0
    }
    
    private func factoryBlur() {
        let effect:UIVisualEffect = UIBlurEffect(style:UIBlurEffectStyle.light)
        let blur:UIVisualEffectView = UIVisualEffectView(effect:effect)
        blur.translatesAutoresizingMaskIntoConstraints = false
        blur.isUserInteractionEnabled = false
        blur.clipsToBounds = true
        
        self.addSubview(blur)
        
        blur.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        blur.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        blur.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        blur.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func animateWith(alpha:CGFloat) {
        UIView.animate(withDuration:ViewConstants.Background.animationDuration) { [weak self] in
            self?.alpha = alpha
        }
    }
}
