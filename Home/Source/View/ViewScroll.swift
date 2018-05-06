import UIKit

class ViewScroll:UIScrollView {
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.Shared.gray
        self.alwaysBounceVertical = true
        self.alwaysBounceHorizontal = true
    }
}
