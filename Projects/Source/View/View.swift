import UIKit
import Shared

public class View:Shared.View<Controller, Presenter, ViewBase>, UITextFieldDelegate {
    public override func initProperties() {
        super.initProperties()
        self.toolbarHidden = false
    }
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.hookDelegates()
        self.hookSelectors()
    }
    
    public override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.content.viewList.updateIndicator()
        }
    }
    
    public override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        self.content.viewList.updateLayout()
    }
    
    public func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidEndEditing(_ textField:UITextField) {
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
        self.content.viewRenamer.viewInput.viewField.resignFirstResponder()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
//        self.presenter.delete()
    }
    
    private func configureView() {
        self.title = String.localized(key:"View_title", in:type(of:self))
        self.setToolbarItems(self.makeToolbarItems(), animated:true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.add,
            target:self, action:#selector(self.selectorAddProject(button:)))
        self.content.viewRenamer.viewInput.viewField.delegate = self
    }
    
    private func hookDelegates() {
        self.presenter.list.view = self.content.viewList
        self.presenter.renamer.view = self.content.viewRenamer
        self.presenter.keyboard.viewContainer = self.content.viewRenamer
        self.presenter.keyboard.layoutBottom = self.content.viewRenamer.layoutBottom
    }
    
    private func hookSelectors() {
        self.content.viewRenamer.viewInput.doneButton.addTarget(
            self, action:#selector(self.selectorRenamingDone(button:)), for:UIControlEvents.touchUpInside)
        self.content.viewRenamer.doneButton.addTarget(
            self, action:#selector(self.selectorRenamingDone(button:)), for:UIControlEvents.touchUpInside)
    }
}
