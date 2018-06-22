import Foundation

public extension PresenterProtocol {
    var transition:TransitionProtocol? {
        get {
            return self.view?.transition
        }
    }
    
    func didLoad() { }
    func willAppear() { }
    func didAppear() { }
    func orientationChanged() { }
}
