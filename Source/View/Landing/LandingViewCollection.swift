import UIKit

class LandingViewCollection:UIScrollView {
    init() {
        super.init(frame:CGRect.zero)
        self.backgroundColor = UIColor.red
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.contentSize = CGSize(width:300, height:900)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
