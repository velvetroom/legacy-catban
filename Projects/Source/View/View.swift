import UIKit
import Shared

class View:Shared.ViewBoard, UITextFieldDelegate {
    weak var viewBase:ViewBase!
    
    override func didLoad() {
        super.didLoad()
        self.hookSelectors()
        self.configureNavigationItem()
        self.configureToolbar()
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
//        self.presenter.updateProject(name:name)
    }
    
    @objc func selectorOpen(button:UIBarButtonItem) {
//        self.presenter.openProject()
    }
    
    @objc func selectorAddProject(button:UIBarButtonItem) {
//        self.presenter.addProject()
    }
    
    @objc func selectorRename(button:UIBarButtonItem) {
//        self.presenter.renameProject()
    }
    
    @objc func selectorRenamingDone(button:UIButton) {
        self.viewBase.viewRenamer.viewInput.viewField.resignFirstResponder()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
//        self.presenter.delete()
    }
    
    private func configurePresenter() {
        self.delegate = Presenter()
    }
    
    private func configureNavigationItem() {
        self.navigationbarHidden = false
        self.title = String.localized(key:"View_title", in:type(of:self))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.add,
            target:self, action:#selector(self.selectorAddProject(button:)))
    }
    
    private func configureToolbar() {
        self.toolbarHidden = false
        self.setToolbarItems(self.makeToolbarItems(), animated:true)
    }
    
    private func configureView() -> ViewBase {
        let viewBase:ViewBase = ViewBase()
        viewBase.viewRenamer.viewInput.viewField.delegate = self
        self.viewBase = viewBase
        return viewBase
    }
    
    private func hookSelectors() {
        self.viewBase.viewRenamer.viewInput.doneButton.addTarget(
            self, action:#selector(self.selectorRenamingDone(button:)), for:UIControlEvents.touchUpInside)
        self.viewBase.viewRenamer.doneButton.addTarget(
            self, action:#selector(self.selectorRenamingDone(button:)), for:UIControlEvents.touchUpInside)
    }
}
