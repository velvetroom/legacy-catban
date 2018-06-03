import UIKit
import Shared

class View:Shared.View, UITextFieldDelegate {
    weak var presenter:Presenter?
    private(set) weak var viewBase:ViewBase!
    
    override func didLoad() {
        super.didLoad()
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
        viewBase.viewBar.deleteButton.addTarget(
            self, action:#selector(self.selectorDelete(button:)), for:UIControlEvents.touchUpInside)
        viewBase.viewInput.doneButton.addTarget(
            self, action:#selector(self.selectorDone(button:)), for:UIControlEvents.touchUpInside)
        viewBase.viewInput.field.delegate = self
        self.viewBase = viewBase
        return viewBase
    }
    
    @objc func selectorDelete(button:UIButton) {
        self.presenter?.delete()
    }
    
    @objc func selectorDone(button:UIButton) {
        self.presenter?.done()
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        self.presenter?.done()
        return true
    }
}
