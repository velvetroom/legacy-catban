import UIKit

class ViewScroll:UIScrollView {
    private(set) weak var viewBase:ViewBase?
    override var frame:CGRect {
        didSet {
            self.updateContentSize()
        }
    }
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.alwaysBounceVertical = true
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
    }
    
    private func factoryViews() {
        let viewBase:ViewBase = ViewBase()
        self.viewBase = viewBase
        self.addSubview(viewBase)
    }
    
    private func updateContentSize() {
        self.contentSize = CGSize(width:self.frame.width, height:ViewConstants.Base.height)
        self.viewBase?.frame = CGRect(origin:CGPoint.zero, size:self.contentSize)
    }
}
