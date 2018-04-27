import UIKit

extension StatsViewCompletion {
    func factoryOutlets() {
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
