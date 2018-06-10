import Foundation

public extension PresenterProtocol {
    func didLoad() {
        self.interactor.didLoad()
    }
    
    func didAppear() {
        self.interactor.didAppear()
    }
}
