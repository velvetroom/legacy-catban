import UIKit
import CleanArchitecture
import Shared

class NamerPresenter<Interactor:NamerInteractorProtocol>:NSObject, PresenterProtocol, UITextFieldDelegate {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required override init() {
        super.init()
    }
    
    func saveWith(name:String) {
        self.interactor.namerFinishedWith(name:name)
    }
    
    func cancel() {
        self.interactor.namerCancelled()
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
        var state:NamerViewModelState = NamerViewModelState()
        state.saveEnabled = true
        state.message = String()
        state.statusValidHidden = false
        state.statusErrorHidden = true
        self.viewModel.update(property:state)
    }
    
    private func nameInvalidWith(error:String) {
        var state:NamerViewModelState = NamerViewModelState()
        state.saveEnabled = false
        state.message = error
        state.statusValidHidden = true
        state.statusErrorHidden = false
        self.viewModel.update(property:state)
    }
}
