import Foundation

public protocol PresentingViewProtocol:class {
    var transition:TransitionProtocol! { get set }
    var presentingViewModel:ViewModelProtocol { get set }
    var interactor:InteractorProtocol! { get }
    
    init()
    func viewModelUpdated()
}
