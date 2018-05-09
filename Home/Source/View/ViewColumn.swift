import UIKit

class ViewColumn:UIView {
    weak var layoutLeft:NSLayoutConstraint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
