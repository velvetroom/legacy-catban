import UIKit

class ViewBoard:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
