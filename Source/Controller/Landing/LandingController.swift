import UIKit

class LandingController:UIViewController {
    var model:LandingProtocol
    
    init() {
        self.model = Landing()
        super.init(nibName:nil, bundle:nil)
        self.adjustNavigationItem()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.factoryOutlets()
        self.model.reloadViewModel()
    }
}
