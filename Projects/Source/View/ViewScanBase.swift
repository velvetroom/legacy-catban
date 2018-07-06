import UIKit

class ViewScanBase:UIView {
    weak var layoutTop:NSLayoutConstraint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.black
        self.isUserInteractionEnabled = false
    }
}
