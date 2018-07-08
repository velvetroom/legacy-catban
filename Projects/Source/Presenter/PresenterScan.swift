import UIKit
import CleanArchitecture
import Architecture

class PresenterScan:PresenterProtocol {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required init() { }
    
    func close() {
        self.transition?.dismissAnimated(completion:nil)
    }
}
