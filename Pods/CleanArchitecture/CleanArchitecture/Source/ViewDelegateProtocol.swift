import Foundation

public protocol ViewDelegateProtocol {
    associatedtype Interactor:InteractorProtocol
    var view:ViewProtocol? { get set }
    var interactor:Interactor! { get set }
    var viewModel:ViewModel! { get set }
    
    init()
    func didLoad()
    func willAppear()
    func didAppear()
    func orientationChanged()
}