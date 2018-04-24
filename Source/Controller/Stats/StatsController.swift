import UIKit

class StatsController<ModelType:StatsProtocol>:Controller<ModelType> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
    }
    
    @objc func selectorDone(sender button:UIBarButtonItem) {
        self.navigation?.transitionToLandingWith(board:self.model.board)
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done, target:self, action:#selector(self.selectorDone(sender:)))
        self.title = String.localizedStats(key:"StatsController_title")
    }
}
