import UIKit

class Controller<ModelType:ModelProtocol>:UIViewController, ControllerProtocol {
    var model:ModelType

    var navigation:ApplicationNavigationController? {
        get {
            return self.navigationController as? ApplicationNavigationController
        }
    }
    
    var safeArea:UILayoutGuide {
        get {
            return self.view.safeAreaLayoutGuide
        }
    }
    
    init() {
        self.model = ModelType()
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
