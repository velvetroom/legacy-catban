import UIKit

class OrganiseController<ModelType:OrganiseProtocol>:Controller<ModelType> {    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
        self.factoryOutlets()
        self.model.reloadViewModel()
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.title = String.localizedOrganise(key:"OrganiseController_title")
    }
    
    @objc private func selectorDone(sender button:UIBarButtonItem) {
        self.navigation?.transitionToLandingWith(board:self.model.board)
    }
}
