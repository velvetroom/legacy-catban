import UIKit

class StatsViewCompletion<ViewModel:StatsViewModelCollectionItemCompletionProtocol>:StatsView<ViewModel> {
    private(set) var radius:CGFloat
    private(set) weak var viewGeneral:StatsViewCompletionGeneral!
    var totalRadians:CGFloat
    
    override init() {
        self.radius = 0
        self.totalRadians = CircleViewModel.Constants.circleRadians
        super.init()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
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
