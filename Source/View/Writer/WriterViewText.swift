import UIKit

class WriterViewText:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
