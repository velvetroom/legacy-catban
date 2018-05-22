import UIKit
import Shared

class View:Shared.View, UITextFieldDelegate {
    weak var presenter:Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationItem()
    }
    
    override func loadView() {
        self.view = ViewBase()
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(true, animated:true)
    }
    
    @objc func selectorDone(sender button:UIBarButtonItem) {
    }
    
    @objc func selectorDelete(sender button:UIBarButtonItem) {
    }
}
