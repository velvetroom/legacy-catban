import UIKit

class LandingErrorController:UIAlertController {
    var model:LandingError
    
    init() {
        self.model = LandingError()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var preferredStyle:UIAlertControllerStyle {
        get {
            return UIAlertControllerStyle.alert
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
