import UIKit
import Shared

class View:Shared.View, UITextFieldDelegate {
    weak var presenter:Presenter!
    private(set) weak var viewBase:ViewBase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationItem()
    }
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(true, animated:true)
    }
    
    private func configureView() -> ViewBase {
        let viewBase:ViewBase = ViewBase()
        viewBase.viewBar.deleteButton.addTarget(
            self, action:#selector(self.selectorDelete(sender:)), for:UIControlEvents.touchUpInside)
        viewBase.viewInput.doneButton.addTarget(
            self, action:#selector(self.selectorDone(sender:)), for:UIControlEvents.touchUpInside)
        viewBase.viewInput.field.delegate = self
        self.viewBase = viewBase
        return viewBase
    }
    
    @objc func selectorDelete(sender button:UIButton) {
        self.presenter.delete()
    }
    
    @objc func selectorDone(sender button:UIButton) {
        self.presenter.done()
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        self.presenter.done()
        return true
    }
}
