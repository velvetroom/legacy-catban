import UIKit

extension StatsController {
    func factoryOutlets() {
        self.factoryCollection()
    }
    
    private func factoryCollection() {
        let viewCollection:StatsViewCollection = StatsViewCollection()
        self.view.addSubview(viewCollection)
        
        viewCollection.topAnchor.constraint(equalTo:self.safeArea.topAnchor).isActive = true
        viewCollection.bottomAnchor.constraint(equalTo:self.safeArea.bottomAnchor).isActive = true
        viewCollection.leftAnchor.constraint(equalTo:self.safeArea.leftAnchor).isActive = true
        viewCollection.rightAnchor.constraint(equalTo:self.safeArea.rightAnchor).isActive = true
    }
}
