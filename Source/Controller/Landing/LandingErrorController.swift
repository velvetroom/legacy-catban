import UIKit

class LandingErrorController:UIAlertController {
    var model:LandingErrorProtocol
    
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
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingAddController_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.model.presenter.actionCancel = action
        self.addAction(action)
    }
}
