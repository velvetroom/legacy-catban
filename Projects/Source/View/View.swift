import UIKit
import Shared

public class View:Shared.View<Interactor, Presenter, ViewContent> {
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.hookDelegates()
    }
    
    public override func willAppear() {
        super.willAppear()
        DispatchQueue.main.async { [weak self] in
            self?.content.viewList.updateSelector()
        }
    }
    
    public override func orientationChanged() {
        super.orientationChanged()
        self.content.viewList.updateLayout()
    }
    
    @objc func selectorOpen(button:UIBarButtonItem) {
//        self.presenter.openProject()
    }
    
    @objc func selectorAddProject(button:UIBarButtonItem) {
//        self.presenter.addProject()
    }
    
    @objc func selectorRename(button:UIBarButtonItem) {
        self.presenter.rename()
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
        self.content.viewList.delegate = self.presenter
        self.content.viewList.dataSource = self.presenter
    }
    
    public override func viewModelUpdated() {
        self.content.viewEmpty.isHidden = self.viewModel.emptyHidden
        self.content.viewList.isHidden = self.viewModel.listHidden
        self.content.viewList.reloadData()
        self.navigationController?.setToolbarHidden(self.viewModel.toolbarHidden, animated:true)
    }
}
