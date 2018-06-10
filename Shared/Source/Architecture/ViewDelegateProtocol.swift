import Foundation

public protocol ViewDelegateProtocol {
    associatedtype Interactor:InteractorProtocol
    var view:PresenterViewProtocol! { get set }
    var interactor:Interactor { get }
    
    init()
    func didLoad()
    func didAppear()
}
