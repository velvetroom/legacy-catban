import UIKit

class ViewRenamerInput:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.isUserInteractionEnabled = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
