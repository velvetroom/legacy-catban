import Foundation
import CleanArchitecture

class MockInteractorProtocol:InteractorProtocol {
    var presenter:InteractorDelegateProtocol?
    
    required init() { }
}
