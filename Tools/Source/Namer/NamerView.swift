import UIKit
import Shared

class NamerView<Interactor:NamerInteractorProtocol>:View
    <Interactor, NamerPresenter<Interactor>, NamerViewModel, NamerViewContent> {
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.initialViewModel()
        self.viewModelUpdated()
    }
    
    override func didAppear() {
        super.didAppear()
        self.content.viewField.becomeFirstResponder()
    }
    
    override func viewModelUpdated() {
        super.viewModelUpdated()
        self.navigationItem.rightBarButtonItem?.isEnabled = self.viewModel.state.saveEnabled
        self.content.labelMessage.text = self.viewModel.state.message
        self.content.viewStatus.statusError.isHidden = self.viewModel.state.statusErrorHidden
        self.content.viewStatus.statusValid.isHidden = self.viewModel.state.statusValidHidden
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
    
    private func initialViewModel() {
        self.title = self.viewModel.title
        self.content.viewField.text = self.viewModel.currentName
    }
    
    @objc private func selectorSave(button:UIBarButtonItem) {
        self.presenter.saveWith(name:self.content.viewField.text!)
        self.closeNamer()
    }
    
    @objc private func selectorCancel(button:UIBarButtonItem) {
        self.presenter.cancel()
        self.closeNamer()
    }
    
    private func closeNamer() {
        self.content.viewField.resignFirstResponder()
        self.transition.pop()
    }
}
