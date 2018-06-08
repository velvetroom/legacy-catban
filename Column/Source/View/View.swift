import UIKit
import Shared

class View:Shared.ViewColumn, UITextFieldDelegate {
    weak var viewScroll:ViewScroll!
    
    override func didLoad() {
        super.didLoad()
        self.configureDelegate()
    }
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    private func configureDelegate() {
        self.delegate = Presenter()
    }
    
    private func configureView() -> ViewScroll {
        let viewScroll:ViewScroll = ViewScroll()
        self.viewScroll = viewScroll
        self.connectOutlets()
        return viewScroll
    }
    
    private func connectOutlets() {
        self.viewScroll.viewBase?.viewBar.deleteButton.addTarget(
            self, action:#selector(self.selectorDelete(button:)), for:UIControlEvents.touchUpInside)
        self.viewScroll.viewBase?.viewInput.doneButton.addTarget(
            self, action:#selector(self.selectorDone(button:)), for:UIControlEvents.touchUpInside)
        self.viewScroll.viewBase?.viewInput.field.delegate = self
    }
    
    @objc func selectorDelete(button:UIButton) {
//        self.presenter?.delete()
    }
    
    @objc func selectorDone(button:UIButton) {
//        self.presenter?.done()
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
//        self.presenter?.done()
        return true
    }
}
