import Foundation

extension PresenterProtocol {
    public func viewDidLoad() {
        self.delegate.viewDidLoad()
    }
}
