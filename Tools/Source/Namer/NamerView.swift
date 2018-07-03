import UIKit
import Architecture

class NamerView<Interactor:NamerInteractorProtocol>:View<NamerPresenter<Interactor>, NamerViewContent> {
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
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
    
    private func configureViewModel() {
        self.configureContentViewModel()
        self.configureStateViewModel()
    }
    
    private func configureContentViewModel() {
        var viewModel:NamerViewModelContent = self.viewModel.property()
        viewModel.observing = { [weak self] (property:NamerViewModelContent) in
            self?.title = property.title
            self?.content.viewField.text = property.currentName
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func configureStateViewModel() {
        var viewModel:NamerViewModelState = NamerViewModelState()
        viewModel.observing = { [weak self] (property:NamerViewModelState) in
            self?.navigationItem.rightBarButtonItem?.isEnabled = property.saveEnabled
            self?.content.labelMessage.text = property.message
            self?.content.viewStatus.statusError.isHidden = property.statusErrorHidden
            self?.content.viewStatus.statusValid.isHidden = property.statusValidHidden
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func closeNamer() {
        self.content.viewField.resignFirstResponder()
        self.presenter.transition?.pop()
    }
}
