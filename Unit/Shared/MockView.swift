import UIKit

class MockView:UIView {
    var onRemoveFromSuperview:(() -> Void)?
    
    init() {
        super.init(frame:CGRect.zero)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func removeFromSuperview() {
        self.onRemoveFromSuperview?()
        super.removeFromSuperview()
    }
}
