import Foundation

public protocol PresentingViewProtocol:class {
    var transition:TransitionProtocol! { get set }
    var interactor:InteractorProtocol! { get }
    
    init()
}
