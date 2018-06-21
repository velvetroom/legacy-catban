import Foundation

public protocol InteractorProtocol {
    var presenter:InteractorPresentationProtocol? { get set }
    
    init()
    func didLoad()
}
