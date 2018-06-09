import Foundation

public protocol ViewDelegateProtocol {
    associatedtype Interactor:InteractorProtocol
    var view:ViewProtocol! { get set }
    var interactor:Interactor { get }
    
    init()
    func didLoad()
    func didAppear()
}
