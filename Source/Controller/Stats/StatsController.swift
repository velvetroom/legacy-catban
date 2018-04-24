import UIKit

class StatsController<ModelType:StatsProtocol>:Controller<ModelType> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.title = String.localizedOrganise(key:"StatsController_title")
    }
}
