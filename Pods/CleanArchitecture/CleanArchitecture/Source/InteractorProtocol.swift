import Foundation

public protocol InteractorProtocol:class {
    var presenter:InteractorDelegateProtocol? { get set }
    
    init()
    func didLoad()
}
