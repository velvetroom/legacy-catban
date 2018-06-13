import Foundation
@testable import Shared

class MockInteractorProtocol:InteractorProtocol {
    weak var presenter:InteractorPresentationProtocol?
    
    required init() { }
}
