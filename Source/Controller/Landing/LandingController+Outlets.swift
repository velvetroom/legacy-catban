import UIKit

extension LandingController {
    func factoryOutlets() {
        self.factoryViewCollection()
    }
    
    private func factoryViewCollection() {
        let viewCollection:LandingViewCollection = LandingViewCollection()
        self.view.addSubview(viewCollection)
        
        viewCollection.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewCollection.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        viewCollection.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewCollection.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        self.outlets.viewCollection = viewCollection
    }
}
