import Foundation

class LandingController:Controller, ControllerProtocol {
    var model:LandingProtocol
    
    override init() {
        self.model = Landing()
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
        self.factoryOutlets()
        self.model.reloadViewModel()
    }
}
