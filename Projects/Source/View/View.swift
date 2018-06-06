import UIKit
import Shared

class View:Shared.View, UITextFieldDelegate {
    weak var presenter:Presenter!
    weak var viewBase:ViewBase!
    
    override func didLoad() {
        super.didLoad()
        self.hookSelectors()
        self.configureNavigationItem()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.viewBase.viewList.updateIndicator()
        }
    }
    
    override func loadView() {
        self.view = self.configureView()
    }
    
    override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        self.viewBase.viewList.updateLayout()
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField:UITextField) {
        guard
            let name:String = textField.text
        else { return }
        self.presenter.updateProject(name:name)
    }
    
    @objc func selectorOpen(button:ViewMenuItem) {
        self.presenter.openProject()
    }
    
    @objc func selectorAddProject(button:UIButton) {
        self.presenter.addProject()
    }
    
    @objc func selectorRename(button:ViewMenuItem) {
        self.presenter.renameProject()
    }
    
    @objc func selectorRenamingDone(button:UIButton) {
        self.viewBase.viewRenamer.viewInput.viewField.resignFirstResponder()
    }
    
    @objc func selectorDelete(button:UIButton) {
        self.presenter.delete()
    }
    
    private func configureNavigationItem() {
        self.title = String.localized(key:"View_title", in:type(of:self))
    }
    
    private func configureView() -> ViewBase {
        let viewBase:ViewBase = ViewBase()
        viewBase.viewRenamer.viewInput.viewField.delegate = self
        self.viewBase = viewBase
        return viewBase
    }
    
    private func hookSelectors() {
        self.viewBase.viewMenu.buttonOpen.addTarget(
            self, action:#selector(self.selectorOpen(button:)), for:UIControlEvents.touchUpInside)
        self.viewBase.viewMenu.buttonRename.addTarget(
            self, action:#selector(self.selectorRename(button:)), for:UIControlEvents.touchUpInside)
        self.viewBase.viewMenu.buttonDelete.addTarget(
            self, action:#selector(self.selectorDelete(button:)), for:UIControlEvents.touchUpInside)
        self.viewBase.viewRenamer.viewInput.doneButton.addTarget(
            self, action:#selector(self.selectorRenamingDone(button:)), for:UIControlEvents.touchUpInside)
        self.viewBase.viewRenamer.doneButton.addTarget(
            self, action:#selector(self.selectorRenamingDone(button:)), for:UIControlEvents.touchUpInside)
    }
}
