import UIKit
import Architecture
import Shared

public class View:Architecture.View<Presenter, ViewContent> {
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
        self.hookDelegates()
    }
    
    public override func willAppear() {
        super.willAppear()
        self.centreSelector()
    }
    
    public override func orientationChanged(size:CGSize) {
        super.orientationChanged(size:size)
        self.content.viewList.updateLayout()
    }
    
    @objc func selectorOpen(button:UIBarButtonItem) {
        self.presenter.openProject()
    }
    
    @objc func selectorAddProject(button:UIBarButtonItem) {
        self.presenter.addProject()
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
            target:self, action:#selector(self.selectorAddProject(buttonStart:)))
    }
    
    private func hookDelegates() {
        self.content.viewList.delegate = self.presenter
        self.content.viewList.dataSource = self.presenter
    }
    
    private func centreSelector() {
        var viewModel:ViewModelSelector = self.viewModel.property()
        viewModel.positionY = self.content.bounds.height / 2.0
        self.viewModel.update(property:viewModel)
    }
}
