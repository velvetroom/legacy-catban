import UIKit

class ErrorController:UIAlertController {
    var model:LandingErrorProtocol
    
    init() {
        self.model = ErrorModel()
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
    
    override var message:String? {
        get {
            return self.model.message
        }
        set { }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedError(key:"ErrorController_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.model.presenter.actionCancel = action
        self.addAction(action)
    }
}
