import UIKit

class OrganiseController<ModelType:OrganiseProtocol>:Controller<ModelType> {    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
        self.factoryOutlets()
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.done,
            target:self, action:#selector(self.selectorDone(sender:)))
        self.title = String.localizedOrganise(key:"OrganiseController_title")
    }
    
    @objc private func selectorDone(sender button:UIBarButtonItem) {
        self.navigation?.transitionToLandingWith(board:self.model.board)
    }
}
