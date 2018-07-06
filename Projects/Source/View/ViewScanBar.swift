import UIKit

class ViewScanBar:UIToolbar {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clear
        self.barStyle = UIBarStyle.black
        self.barTintColor = UIColor.clear
        self.tintColor = UIColor.white
        self.isTranslucent = true
        self.setBackgroundImage(UIImage(), forToolbarPosition:UIBarPosition.any, barMetrics:UIBarMetrics.default)
        self.setShadowImage(UIImage(), forToolbarPosition:UIBarPosition.any)
    }
}
