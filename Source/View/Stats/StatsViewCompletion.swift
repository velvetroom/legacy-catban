import UIKit

class StatsViewCompletion<ViewModel:StatsViewModelCollectionItemCompletionProtocol>:StatsView<ViewModel> {
    private(set) var outerCircleRadius:CGFloat!
    private(set) var middleCircleRadius:CGFloat!
    private(set) var innerCircleRadius:CGFloat!
    private(set) weak var viewGeneral:StatsViewCompletionGeneral!
    
    override init() {
        super.init()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func drawCircle() {
        self.context.addArc(center:self.centre, radius:self.innerCircleRadius,
                            startAngle:StatsViewCompletionConstants.startAngle,
                            endAngle:StatsViewCompletionConstants.endAngle, clockwise:false)
    }
    
    override func draw(_ rect:CGRect) {
        let minSize:CGFloat = min(rect.width, rect.height)
        let halfSize:CGFloat = minSize / 2.0
        self.outerCircleRadius = halfSize - StatsViewCompletionConstants.outerMargin
        self.middleCircleRadius = self.outerCircleRadius - StatsViewCompletionConstants.outerCirclePadding
        self.innerCircleRadius = self.middleCircleRadius - StatsViewCompletionConstants.middleCirclePadding
        super.draw(rect)
    }
    
    private func factoryOutlets() {
        self.factoryGeneral()
    }
    
    private func factoryGeneral() {
        let viewGeneral:StatsViewCompletionGeneral = StatsViewCompletionGeneral()
        self.viewGeneral = viewGeneral
        
        self.addSubview(viewGeneral)
        
        viewGeneral.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewGeneral.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewGeneral.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewGeneral.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
