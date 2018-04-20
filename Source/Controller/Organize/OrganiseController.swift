import UIKit

class OrganiseController:Controller, ControllerProtocol {
    var model:OrganiseProtocol
    
    override init() {
        self.model = Organise()
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
    }
    
    func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                                 target:nil, action:nil)
        self.title = String.localizedOrganise(key:"OrganiseController_title")
    }
}
