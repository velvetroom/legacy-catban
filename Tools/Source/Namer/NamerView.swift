import UIKit
import Shared

class NamerView<Interactor:NamerInteractorProtocol>:View
    <Interactor, NamerPresenter<Interactor>, NamerViewModel, NamerViewBase> {
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
        self.configureView()
    }
    
    override func didAppear() {
        super.didAppear()
        self.content.viewField.becomeFirstResponder()
    }
    
    private func configureView() {
        self.title = self.viewModel.title
        self.content.viewField.text = self.viewModel.currentName
        self.content.viewField.delegate = self.presenter
        self.content.viewStatus.isHidden = true
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
        self.presenter.cancel()
        self.closeNamer()
    }
    
    private func closeNamer() {
        self.content.viewField.resignFirstResponder()
        self.transition.pop()
    }
}
