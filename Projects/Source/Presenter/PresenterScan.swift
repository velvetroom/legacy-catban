import UIKit
import CleanArchitecture
import Architecture
import Shared

class PresenterScan:PresenterProtocol {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required init() { }
    
    func close() {
        self.transition?.dismissAnimated(completion:nil)
    }
    
    func read(string:String) {
        self.showError(message:"hello world")
    }
    
    private func showLoading() {
        var viewModel:ViewModelScan = self.viewModel.property()
        viewModel.buttonAcceptHidden = true
        viewModel.buttonContinueHidden = true
        viewModel.spinnerAnimating = true
        viewModel.message = String()
        self.viewModel.update(property:viewModel)
    }
    
    private func showError(message:String) {
        var viewModel:ViewModelScan = self.viewModel.property()
        viewModel.buttonAcceptHidden = false
        viewModel.buttonContinueHidden = true
        viewModel.spinnerAnimating = false
        viewModel.message = message
        self.viewModel.update(property:viewModel)
    }
    
    private func showSuccess() {
        var viewModel:ViewModelScan = self.viewModel.property()
        viewModel.buttonAcceptHidden = true
        viewModel.buttonContinueHidden = false
        viewModel.spinnerAnimating = false
        viewModel.message = String.localized(key:"PresenterScan_Success", in:type(of:self))
        self.viewModel.update(property:viewModel)
    }
}
