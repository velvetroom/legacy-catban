import UIKit
import Shared

class View:Shared.View, UITextFieldDelegate {
    weak var presenter:Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationItem()
    }
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(true, animated:true)
    }
    
    private func configureView() -> ViewBase {
        let viewBase:ViewBase = ViewBase()
        
        return viewBase
    }
    
    @objc func selectorDone(sender button:UIBarButtonItem) {
    }
    
    @objc func selectorDelete(sender button:UIBarButtonItem) {
    }
}
