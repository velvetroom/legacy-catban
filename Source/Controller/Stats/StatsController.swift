import UIKit

class StatsController<ModelType:StatsProtocol>:Controller<ModelType> {
    private var collection:StatsViewCollection? {
        get {
            return self.model.presenter.outlets.collection
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
        self.factoryOutlets()
        self.model.reloadViewModel()
    }
    
    @objc func selectorDone(sender button:UIBarButtonItem) {
        self.navigation?.transitionToLandingWith(board:self.model.board)
    }
    
    override func viewWillLayoutSubviews() {
        DispatchQueue.main.async { [weak self] in
            self?.collection?.collectionViewLayout.invalidateLayout()
        }
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done, target:self, action:#selector(self.selectorDone(sender:)))
        self.title = String.localizedStats(key:"StatsController_title")
    }
}
