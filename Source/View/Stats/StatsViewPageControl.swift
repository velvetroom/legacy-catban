import UIKit

class StatsViewPageControl:UIPageControl {
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfPages = 5
        self.pageIndicatorTintColor = UIColor.Shared.gray
        self.currentPageIndicatorTintColor = UIColor.Shared.blue
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
