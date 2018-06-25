import UIKit
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var interactor:MockInteractorProtocol!
    var viewModel:ViewModel!
    var view:ViewProtocol?
    
    required init() { }
}
