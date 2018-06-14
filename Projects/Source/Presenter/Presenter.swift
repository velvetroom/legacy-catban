import Foundation
import Board
import Shared

public class Presenter:NSObject, PresenterProtocol {
    public typealias ViewModel = Projects.ViewModel
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    
    public required override init() {
        super.init()
    }
    
    public func didLoad() {
        self.viewModel = ViewModel()
    }
}
