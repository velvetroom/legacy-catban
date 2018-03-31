import UIKit

class LandingController:UIViewController {
    let model:Landing
    
    init() {
        self.model = Landing()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
        self.factoryOutlets()
        self.model.load()
    }
}
