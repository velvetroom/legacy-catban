import Foundation

public protocol ViewDelegateProtocol {
    associatedtype Interactor:InteractorProtocol
    var presenting:PresenterViewProtocol! { get set }
    var interactor:Interactor! { get set }
    
    init()
    func didLoad()
    func didAppear()
}
