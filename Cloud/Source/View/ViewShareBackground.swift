import UIKit

class ViewShareBackground:UIView {
    weak var blur:UIVisualEffectView!
    
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
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.alpha = ViewConstants.ShareBackground.alphaClose
    }
    
    private func makeOutlets() {
        let effect:UIVisualEffect = UIBlurEffect(style:UIBlurEffectStyle.dark)
        let blur:UIVisualEffectView = UIVisualEffectView(effect:effect)
        blur.translatesAutoresizingMaskIntoConstraints = false
        blur.isUserInteractionEnabled = false
        blur.clipsToBounds = true
        self.blur = blur
        self.addSubview(blur)
    }
    
    private func layoutOutlets() {
        self.blur.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.blur.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.blur.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.blur.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
