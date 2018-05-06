import Foundation
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var delegate:PresenterDelegateProtocol!
    
    init() { }
}
