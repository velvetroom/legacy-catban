import Foundation
import CleanArchitecture
@testable import Shared

class MockInteractorProtocol:InteractorProtocol {
    var onDidLoad:(() -> Void)?
    weak var presenter:InteractorDelegateProtocol?
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
}
