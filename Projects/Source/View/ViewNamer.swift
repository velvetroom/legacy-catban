import UIKit
import Shared
import Tools

class ViewNamer:Shared.View<Controller, PresenterNamer, ViewNamerBase>, UITextFieldDelegate {
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureNavigationItem()
    }
    
    override func viewModelUpdated() {
        super.viewModelUpdated()
//        self.content.viewField.text = self.viewModel.name
    }
    
    override func didAppear() {
        super.didAppear()
        self.content.viewField.delegate = self
        self.content.viewField.becomeFirstResponder()
        self.validate()
    }
    
    func textField(_ textField:UITextField,
                   shouldChangeCharactersIn range:NSRange, replacementString string:String) -> Bool {
        guard
            let currentText:String = textField.text,
            let range:Range = Range(range, in:currentText)
        else { return true }
        let updatedText:String = currentText.replacingCharacters(in:range, with:string)
        self.content.viewStatus.isHidden = false
        self.validate(name:updatedText)
        return true
    }
    
    public func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func configureView() {
        self.title = String.localized(key:"ViewNamer_title", in:type(of:self))
        self.content.viewStatus.isHidden = true
    }
    
    private func configureNavigationItem() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.cancel, target:self,
            action:#selector(self.selectorCancel(button:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.save, target:self,
            action:#selector(self.selectorSave(button:)))
        self.disableSave()
    }
    
    private func validate() {
        self.validate(name:self.content.viewField.text!)
    }
    
    private func validate(name:String) {
        let validator:NamingValidatorProtocol = NamingValidatorFactory.makeValidator()
        do {
            try validator.validate(name:name)
        } catch let error {
            self.nameInvalidWith(error:error.localizedDescription)
            return
        }
        self.nameValid()
    }
    
    private func nameValid() {
        self.enableSave()
        self.content.labelError.text = nil
        self.content.viewStatus.statusValid()
    }
    
    private func nameInvalidWith(error:String) {
        self.disableSave()
        self.content.labelError.text = error
        self.content.viewStatus.statusError()
    }
    
    private func enableSave() {
        self.navigationItem.leftBarButtonItem?.isEnabled = true
    }
    
    private func disableSave() {
        self.navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    @objc private func selectorSave(button:UIBarButtonItem) {
        self.content.viewField.resignFirstResponder()
//        self.presenter.updateProject(name:self.content.viewField.text!, for:self.viewModel.identifier)
        self.transition.pop()
    }
    
    @objc private func selectorCancel(button:UIBarButtonItem) {
        self.content.viewField.resignFirstResponder()
        self.transition.pop()
    }
}
