import UIKit

class LandingController:UIViewController {
    var outlets:LandingControllerOutlets
    
    init() {
        self.outlets = LandingControllerOutlets()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.add,
            target:self,
            action:#selector(self.selectorAdd(sender:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.edit,
            target:self,
            action:#selector(self.selectorEdit(sender:)))
        self.title = String.localizedLanding(key:"LandingController_title")
        self.factoryOutlets()
    }
}
