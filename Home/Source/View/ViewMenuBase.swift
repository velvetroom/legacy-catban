import UIKit

class ViewMenuBase:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor(white:0, alpha:0.5)
    }
}
