import UIKit

class ApplicationNavigationController:UINavigationController {
    init() {
        super.init(nibName:nil, bundle:nil)
        self.addChildViewController(LandingController())
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.backgroundColor = UIColor.white
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.tintColor = UIColor.black
    }
}
