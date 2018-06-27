import Foundation
import CleanArchitecture

class MockInteractorProtocol:InteractorProtocol {
    var onDidLoad:(() -> Void)?
    weak var presenter:InteractorDelegateProtocol?
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
}
