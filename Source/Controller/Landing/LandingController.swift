import UIKit

class LandingController:UIViewController {
    var outlets:LandingControllerOutlets
    
    init() {
        self.outlets = LandingControllerOutlets()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.factoryOutlets()
    }
}
