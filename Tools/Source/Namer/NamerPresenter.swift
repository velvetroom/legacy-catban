import UIKit
import Shared

class NamerPresenter<Interactor:NamerInteractorProtocol>:NSObject, PresenterProtocol, UITextFieldDelegate {
    weak var presenting:PresentingViewProtocol?
    weak var viewStatus:NamerViewStatus?
    weak var labelError:UILabel?
    weak var buttonSave:UIBarButtonItem?
    var interactor:Interactor!
    var viewModel:NamerViewModel!
    
    required override init() {
        super.init()
    }
    
    func saveWith(name:String) {
        self.interactor.namerFinishedWith(name:name)
    }
    
    func didAppear() {
        self.buttonSave?.isEnabled = false
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
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func validate(name:String) {
        let validator:NamerValidatorComposite = NamerValidatorComposite()
        do {
            try validator.validate(name:name)
        } catch let error {
            self.nameInvalidWith(error:error.localizedDescription)
            return
        }
        self.nameValid()
    }
    
    private func nameValid() {
        self.buttonSave?.isEnabled = true
        self.labelError?.text = nil
        self.viewStatus?.statusValid()
    }
    
    private func nameInvalidWith(error:String) {
        self.buttonSave?.isEnabled = false
        self.labelError?.text = error
        self.viewStatus?.statusError()
    }
}
