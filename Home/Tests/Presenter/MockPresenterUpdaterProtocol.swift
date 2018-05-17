import Foundation
@testable import Home

class MockPresenterUpdaterProtocol:PresenterUpdaterProtocol {
    static var updated:MockPresenterUpdaterProtocol!
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    var drag:Map!
    
    required init() { }
    
    func update() {
        MockPresenterUpdaterProtocol.updated = self
    }
}
