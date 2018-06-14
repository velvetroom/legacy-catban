import UIKit
import Shared

public class View:Shared.View<Controller, Presenter, Column.ViewModel, ViewScroll>, UITextFieldDelegate {
    weak var viewScroll:ViewScroll!
    
    public override func loadView() {
        self.view = self.configureView()
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
    
    public func textFieldShouldReturn(_ textField:UITextField) -> Bool {
//        self.presenter?.done()
        return true
    }
}
