import Foundation

public protocol PresentingViewProtocol:class {
    var transition:TransitionProtocol! { get set }
    var toolbarHidden:Bool { get set }
    var navigationbarHidden:Bool { get set }
    var interactor:InteractorProtocol! { get }
    
    init()
    func viewModelUpdated()
}
