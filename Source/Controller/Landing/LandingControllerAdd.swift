import UIKit

class LandingControllerAdd:UIAlertController {
    weak var delegate:LandingControllerAddDelegateProtocol?
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
