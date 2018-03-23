import UIKit

class ApplicationNavigationController:UINavigationController {
    init() {
        super.init(nibName:nil, bundle:nil)
        self.addChildViewController(LandingController())
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
