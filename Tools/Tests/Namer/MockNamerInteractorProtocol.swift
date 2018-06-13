import Foundation
import Shared
import Tools

class MockNamerInteractorProtocol:NamerInteractorProtocol {
    weak var presenter:InteractorPresentationProtocol?
    
    required init() { }
}
