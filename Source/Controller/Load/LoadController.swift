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
    }
    
    private func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.title = String.localizedLoad(key:"LoadController_title")
    }
}
