import UIKit

class View:UIScrollView, MapDelegateProtocol {
    weak var content:ViewContent!
    
    var drag:DragProtocol {
        get {
            return self.content.drag
        }
        set(newValue) {
            self.content.drag = newValue
        }
    }
    
    override var frame:CGRect {
        didSet {
            if self.content != nil {
                self.updateContentSize()
            }
        }
    }
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func clear() {
        self.content.clear()
    }
    
    func mapChanged(size:CGSize) {
        self.updateContent(size:size)
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
    
    override func addSubview(_ view:UIView) {
        self.content.addSubview(view)
    }
    
    private func updateSubview() {
        self.content.frame = CGRect(origin:CGPoint.zero, size:self.contentSize)
    }
    
    private func configureView() {
        self.configureScroll()
        self.configureContent()
    }
    
    private func configureScroll() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.Shared.gray
        self.alwaysBounceVertical = true
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.canCancelContentTouches = false
    }
    
    private func configureContent() {
        let content:ViewContent = ViewContent()
        self.content = content
        super.addSubview(content)
    }
}
