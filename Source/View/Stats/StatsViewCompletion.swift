import UIKit

class StatsViewCompletion:StatsView<StatsViewModelCollectionItemCompletion> {
    private(set) var radius:CGFloat
    private(set) weak var viewGeneral:StatsViewCompletionGeneral!
    
    override init() {
        self.radius = 0
        super.init()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func render() {
        for circle:CircleViewModel in self.viewModel.circles {
            self.renderCircleWith(viewModel:circle)
        }
    }
    
    override func draw(_ rect:CGRect) {
        let minSize:CGFloat = min(rect.width, rect.height)
        self.radius = minSize / 2.0
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
