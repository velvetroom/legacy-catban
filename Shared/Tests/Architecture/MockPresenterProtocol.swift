import Foundation
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var onDidLoad:(() -> Void)?
    var onWillAppear:(() -> Void)?
    var onDidAppear:(() -> Void)?
    var onOrientationChanged:(() -> Void)?
    weak var view:ViewProtocol?
    var interactor:MockInteractorProtocol!
    var viewModel:ViewModel!
    
    required init() { }
    
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
