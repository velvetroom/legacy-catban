import Foundation

public protocol ViewDelegateProtocol {
    associatedtype Interactor:InteractorProtocol
    associatedtype ViewModel:ViewModelProtocol
    var presenting:PresentingViewProtocol? { get set }
    var interactor:Interactor! { get set }
    var viewModel:ViewModel! { get set }
    
    init()
    func didLoad()
    func willAppear()
    func didAppear()
    func orientationChanged()
}
