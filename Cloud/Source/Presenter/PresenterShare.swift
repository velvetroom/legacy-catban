import UIKit
import CleanArchitecture
import Architecture

class PresenterShare:PresenterProtocol {
    weak var transition:TransitionProtocol?
    weak var view:ViewProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required init() { }
    
    func didAppear() {
        self.interactor.generateQr { [weak self] (image:UIImage) in
            self?.generatedQr(image:image)
        }
    }
    
    private func generatedQr(image:UIImage) {
        var viewModel:ViewModelQr = self.viewModel.property()
        viewModel.image = image
        self.viewModel.update(property:viewModel)
    }
}
