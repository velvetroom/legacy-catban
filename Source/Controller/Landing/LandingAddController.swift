import UIKit

class LandingAddController:UIAlertController {
    weak var delegate:LandingAddControllerDelegateProtocol?
    var model:LandingProtocol
    
    init() {
        self.model = Landing()
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
