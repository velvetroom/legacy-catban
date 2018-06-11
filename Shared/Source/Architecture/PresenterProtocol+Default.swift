import Foundation

public extension PresenterProtocol {
    public var transition:TransitionProtocol? {
        get {
            return self.presenting?.transition
        }
    }
    
    func didLoad() {
        self.interactor.didLoad()
    }
    
    func didAppear() {
        self.interactor.didAppear()
    }
}
