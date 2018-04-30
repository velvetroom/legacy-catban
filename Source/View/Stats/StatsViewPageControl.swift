import UIKit

class StatsViewPageControl:UIPageControl {
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.pageIndicatorTintColor = UIColor(white:0, alpha:0.1)
        self.currentPageIndicatorTintColor = UIColor.Shared.blue
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
