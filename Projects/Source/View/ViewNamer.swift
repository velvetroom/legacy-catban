import UIKit
import Shared
import Tools

class ViewNamer:Shared.View<Controller, Presenter, ViewNamerBase>, UITextFieldDelegate {
    private var viewModel:ViewModelListItem {
        get {
            let viewModel:ViewModelEdit = self.presenter.viewModel as! ViewModelEdit
            return viewModel.item
        }
    }
    
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
    }
    
    override func viewModelUpdated() {
        super.viewModelUpdated()
        self.content.viewField.text = self.viewModel.name
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
        self.validate(name:updatedText)
        return true
    }
    
    public func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func configureNavigationItem() {
        self.title = String.localized(key:"ViewNamer_title", in:type(of:self))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.save, target:self,
            action:#selector(self.selectorSave(button:)))
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
        self.content.viewStatus.statusValid()
        self.content.labelError.text = nil
        self.navigationItem.leftBarButtonItem?.isEnabled = true
    }
    
    private func nameInvalidWith(error:String) {
        self.content.viewStatus.statusError()
        self.content.labelError.text = error
        self.navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    @objc private func selectorSave(button:UIButton) {
        self.presenter.updateProject(name:self.content.viewField.text!, for:self.viewModel.identifier)
        self.transition.pop()
    }
}
