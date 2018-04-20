import UIKit

class Controller:UIViewController {
    var navigation:ApplicationNavigationController? {
        get {
            return self.navigationController as? ApplicationNavigationController
        }
    }
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
}
