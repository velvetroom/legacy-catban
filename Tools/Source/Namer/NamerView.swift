import UIKit
import Shared

class NamerView<Interactor:NamerInteractorProtocol>:View<Interactor, NamerPresenter<Interactor>, NamerViewContent> {
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureObservers()
    }
    
    override func didAppear() {
        super.didAppear()
        self.content.viewField.becomeFirstResponder()
    }
    
    @objc func selectorSave(button:UIBarButtonItem) {
        self.presenter.saveWith(name:self.content.viewField.text!)
        self.closeNamer()
    }
    
    @objc func selectorCancel(button:UIBarButtonItem) {
        self.presenter.cancel()
        self.closeNamer()
    }
    
    private func configureView() {
        self.content.viewField.delegate = self.presenter
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.cancel,
            target:self, action:#selector(self.selectorCancel(button:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.save, target:self,
            action:#selector(self.selectorSave(button:)))
    }
    
    private func configureObservers() {
        self.configureContentObserver()
        self.configureStateObserver()
    }
    
    private func configureContentObserver() {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.observing = self.updated
        self.presenter.viewModel.update(property:viewModel)
    }
    
    private func configureStateObserver() {
        var viewModel:NamerViewModelState = NamerViewModelState()
        viewModel.observing = self.updated
        self.presenter.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:NamerViewModelContent) {
        self.title = viewModel.title
        self.content.viewField.text = viewModel.currentName
    }
    
    private func updated(viewModel:NamerViewModelState) {
        self.navigationItem.rightBarButtonItem?.isEnabled = viewModel.saveEnabled
        self.content.labelMessage.text = viewModel.message
        self.content.viewStatus.statusError.isHidden = viewModel.statusErrorHidden
        self.content.viewStatus.statusValid.isHidden = viewModel.statusValidHidden
    }
    
    private func closeNamer() {
        self.content.viewField.resignFirstResponder()
        self.transition.pop()
    }
}
