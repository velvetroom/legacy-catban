import UIKit

class LoadController:UIViewController {
    var model:LoadProtocol
    
    init() {
        self.model = Load()
        super.init(nibName:nil, bundle:nil)
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
    
    func openLanding(board:BoardProtocol) {
        let controller:LandingController = LandingController()
        controller.model.board = board
        self.navigationController?.setViewControllers([controller], animated:false)
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.title = String.localizedLoad(key:"LoadController_title")
    }
    
    private func loadBoard() {
        self.model.loadBoard { [weak self] (board:BoardProtocol) in
            self?.openLanding(board:board)
        }
    }
}
