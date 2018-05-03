import UIKit

class ApplicationNavigationController:UINavigationController {
    init() {
        super.init(nibName:nil, bundle:nil)
        let controller:LoadController<Load> = LoadController<Load>()
        self.addChildViewController(controller)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.backgroundColor = UIColor.white
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}