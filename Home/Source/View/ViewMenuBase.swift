import UIKit

class ViewMenuBase:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.clear
    }
    
    private func factoryViews() {
        self.factoryBackground()
    }
    
    private func factoryBackground() {
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
}
