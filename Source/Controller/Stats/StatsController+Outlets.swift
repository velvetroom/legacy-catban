import UIKit

extension StatsController {
    private var outlets:StatsPresenterOutlets {
        get {
            return self.model.presenter.outlets
        }
        set(newValue) {
            self.model.presenter.outlets = newValue
        }
    }
    
    func factoryOutlets() {
        self.factoryCollection()
    }
    
    private func factoryCollection() {
        let viewCollection:StatsViewCollection = StatsViewCollection()
        viewCollection.dataSource = self.model.presenter.collection
        self.outlets.collection = viewCollection
        
        self.view.addSubview(viewCollection)
        
        viewCollection.topAnchor.constraint(equalTo:self.safeArea.topAnchor).isActive = true
        viewCollection.bottomAnchor.constraint(equalTo:self.safeArea.bottomAnchor).isActive = true
        viewCollection.leftAnchor.constraint(equalTo:self.safeArea.leftAnchor).isActive = true
        viewCollection.rightAnchor.constraint(equalTo:self.safeArea.rightAnchor).isActive = true
    }
}
