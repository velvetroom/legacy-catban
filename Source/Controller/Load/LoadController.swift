import UIKit

class LoadController:Controller, ControllerProtocol {
    var model:LoadProtocol
    
    override init() {
        self.model = Load()
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
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
