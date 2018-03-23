import UIKit

extension LandingController {
    func factoryOutlets() {
        self.factoryViewCollection()
    }
    
    private func factoryViewCollection() {
        let viewCollection:LandingViewCollection = LandingViewCollection()
        self.view.addSubview(viewCollection)
        
        self.outlets.viewCollection = viewCollection
    }
}
