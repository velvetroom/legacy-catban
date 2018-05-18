import UIKit

class View:UIScrollView {
    override var frame:CGRect {
        didSet {
            self.updateContentSize()
        }
    }
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateContentSize() {
        self.updateContent(size:self.contentSize)
    }
    
    func updateContent(size:CGSize) {
        let width:CGFloat = max(size.width, self.frame.width)
        let height:CGFloat = max(size.height, self.frame.height)
        self.contentSize = CGSize(width:width, height:height)
        self.updateSubview()
    }
    
    private func updateSubview() {
        guard
            let subview:UIView = self.subviews.first
        else { return }
        subview.frame = CGRect(origin:CGPoint.zero, size:self.contentSize)
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.Shared.gray
        self.alwaysBounceVertical = true
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.canCancelContentTouches = false
    }
}
