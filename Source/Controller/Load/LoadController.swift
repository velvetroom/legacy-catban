import UIKit

class LoadController<ModelType:LoadProtocol>:Controller<ModelType> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustNavigationItem()
        self.factoryOutlets()
        self.loadBoard()
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.title = String.localizedLoad(key:"LoadController_title")
    }
    
    private func loadBoard() {
        self.model.loadBoard { [weak self] (board:BoardProtocol) in
            self?.navigation?.transitionToLandingWith(board:board)
        }
    }
}
