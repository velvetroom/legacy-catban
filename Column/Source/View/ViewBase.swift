import UIKit

class ViewBase:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
