import UIKit
import Shared

public class View:Shared.View<Controller, Presenter, ViewBase> {
    public override func initProperties() {
        super.initProperties()
        self.toolbarHidden = false
    }
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.hookDelegates()
    }
    
    public override func willAppear() {
        super.willAppear()
        DispatchQueue.main.async { [weak self] in
            self?.content.viewList.updateIndicator()
        }
    }
    
    public override func orientationChanged() {
        super.orientationChanged()
        self.content.viewList.updateLayout()
    }
    
    @objc func selectorOpen(button:UIBarButtonItem) {
        self.presenter.openProject()
    }
    
    @objc func selectorAddProject(button:UIBarButtonItem) {
        self.presenter.addProject()
    }
    
    @objc func selectorRename(button:UIBarButtonItem) {
        self.presenter.renameProject()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
        self.presenter.delete()
    }
    
    private func configureView() {
        self.title = String.localized(key:"View_title", in:type(of:self))
        self.setToolbarItems(self.makeToolbarItems(), animated:true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.add,
            target:self, action:#selector(self.selectorAddProject(button:)))
    }
    
    private func hookDelegates() {
        self.presenter.list.view = self.content.viewList
    }
    
    public override func viewModelUpdated() {
        self.content.viewList.isHidden = self.presenter.viewModel.listHidden
        self.content.viewEmpty.isHidden = self.presenter.viewModel.emptyHidden
        self.navigationController?.setToolbarHidden(self.presenter.viewModel.toolbarHidden, animated:true)
    }
}
