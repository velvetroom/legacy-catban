import UIKit
import Shared

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
    }
    
    public func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        self.transition.pop()
        return true
    }
    
    public func textFieldDidEndEditing(_ textField:UITextField) {
        if let name:String = textField.text {
            self.presenter.updateProject(name:name, for:self.viewModel.identifier)
        }
    }
    
    private func configureNavigationItem() {
        self.title = String.localized(key:"ViewNamer_title", in:type(of:self))
    }
}
