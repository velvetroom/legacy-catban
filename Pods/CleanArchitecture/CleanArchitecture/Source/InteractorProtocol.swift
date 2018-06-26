import Foundation

public protocol InteractorProtocol {
    var presenter:InteractorDelegateProtocol? { get set }
    
    init()
    func didLoad()
}
