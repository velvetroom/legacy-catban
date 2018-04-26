import UIKit

class StatsView:UIView {
    private(set) weak var context:CGContext!
    private(set) var size:CGSize!
    private(set) var centre:CGPoint!
    
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func layoutSubviews() {
        self.setNeedsDisplay()
        super.layoutSubviews()
    }
    
    func render() { }
    
    override func draw(_ rect:CGRect) {
        guard
            let context:CGContext = UIGraphicsGetCurrentContext()
        else { return }
        self.context = context
        self.size = rect.size
        self.centre = CGPoint(x:self.size.width / 2.0, y: self.size.height / 2.0)
        self.render()
    }
}
