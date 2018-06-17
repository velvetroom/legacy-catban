import Foundation
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var onDidLoad:(() -> Void)?
    var onWillAppear:(() -> Void)?
    var onDidAppear:(() -> Void)?
    var onOrientationChanged:(() -> Void)?
    weak var presenting:PresentingViewProtocol?
    var interactor:MockInteractorProtocol!
    var viewModel:ViewModel
    
    required init() {
        self.viewModel = ViewModel()
    }
    
    func didLoad() {
        self.onDidLoad?()
    }
    
    func willAppear() {
        self.onWillAppear?()
    }
    
    func didAppear() {
        self.onDidAppear?()
    }
    
    func orientationChanged() {
        self.onOrientationChanged?()
    }
}
