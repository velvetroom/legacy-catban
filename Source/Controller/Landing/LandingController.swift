import UIKit

class LandingController:UIViewController {
    private(set) var outlets:LandingControllerOutlets
    
    init() {
        self.outlets = LandingControllerOutlets()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
