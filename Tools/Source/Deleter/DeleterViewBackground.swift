import UIKit

class DeleterViewBackground:UIView {
    weak var button:UIButton!
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
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = DeleterConstats.Background.alphaOff
    }
    
    private func makeOutlets() {
        self.makeBlur()
        self.makeButton()
    }
    
    private func layoutOutlets() {
        self.layoutBlur()
        self.layuoutButton()
    }
    
    private func makeBlur() {
        let blurEffect:UIBlurEffect = UIBlurEffect(style:UIBlurEffectStyle.dark)
        let blur:UIVisualEffectView = UIVisualEffectView(effect:blurEffect)
        blur.isUserInteractionEnabled = false
        blur.translatesAutoresizingMaskIntoConstraints = false
        blur.clipsToBounds = true
        self.blur = blur
        self.addSubview(blur)
    }
    
    private func makeButton() {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        self.button = button
        self.addSubview(button)
    }
    
    private func layoutBlur() {
        self.layoutEqualTo(view:self.blur)
    }
    
    private func layuoutButton() {
        self.layoutEqualTo(view:self.button)
    }
    
    private func layoutEqualTo(view:UIView) {
        view.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
