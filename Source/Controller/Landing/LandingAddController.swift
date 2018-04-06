import UIKit

class LandingAddController:UIAlertController {
    var model:LandingAddProtocol
    
    init() {
        self.model = LandingAdd()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var preferredStyle:UIAlertControllerStyle {
        get {
            return UIAlertControllerStyle.actionSheet
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.factoryActions()
    }
}
