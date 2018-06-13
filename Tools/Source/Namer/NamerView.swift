import UIKit
import Shared

class NamerView<Interactor:NamerInteractorProtocol>:View<Interactor, NamerPresenter<Interactor>, NamerViewBase> {
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureNavigationItem()
    }
    
    override func didAppear() {
        super.didAppear()
        self.content.viewField.becomeFirstResponder()
    }
    
    private func configureView() {
        self.title = self.presenter.viewModel.title
        self.content.viewField.text = self.presenter.viewModel.currentName
        self.content.viewField.delegate = self.presenter
        self.content.viewStatus.isHidden = true
        self.presenter.viewStatus = self.content.viewStatus
        self.presenter.labelError = self.content.labelError
        self.presenter.buttonSave = self.navigationItem.rightBarButtonItem
    }
    
    private func configureNavigationItem() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.cancel,
            target:self, action:#selector(self.selectorCancel(button:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.save, target:self,
            action:#selector(self.selectorSave(button:)))
    }
    
    @objc private func selectorSave(button:UIBarButtonItem) {
        self.presenter.saveWith(name:self.content.viewField.text!)
        self.closeNamer()
    }
    
    @objc private func selectorCancel(button:UIBarButtonItem) {
        self.closeNamer()
    }
    
    private func closeNamer() {
        self.content.viewField.resignFirstResponder()
        self.transition.pop()
    }
}
