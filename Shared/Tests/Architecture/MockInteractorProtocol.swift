import Foundation
@testable import Shared

class MockInteractorProtocol:InteractorProtocol {
    var onDidLoad:(() -> Void)?
    weak var presenter:InteractorPresentationProtocol?
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
}
