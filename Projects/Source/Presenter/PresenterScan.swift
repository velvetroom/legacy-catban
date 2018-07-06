import Foundation
import CleanArchitecture
import Board
import Architecture
import Tools

class PresenterScan:PresenterProtocol {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required init() { }
    
    func close() {
        self.transition?.dismiss()
    }
}
