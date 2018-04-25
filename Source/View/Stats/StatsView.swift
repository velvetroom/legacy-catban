import UIKit

class StatsView:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func drawWith(context:CGContext, in rect:CGRect) { }
    
    override func draw(_ rect:CGRect) {
        guard
            let context:CGContext = UIGraphicsGetCurrentContext()
        else { return }
        self.drawWith(context:context, in:rect)
    }
}
