import Foundation
@testable import Home

class MockPresenterUpdaterProtocol:PresenterUpdaterProtocol {
    static var updated:MockPresenterUpdaterProtocol!
    weak var map:MapProtocol!
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    
    required init() { }
    
    func update() {
        MockPresenterUpdaterProtocol.updated = self
    }
}
