import Foundation
@testable import catban

class MockOrganisePresenterFactoryProtocol:OrganisePresenterFactoryProtocol {
    var onFactoryWithBoard:((BoardProtocol) -> Void)?
    
    func factoryWith(board:BoardProtocol) -> OrganiseViewModel {
        self.onFactoryWithBoard?(board)
        return OrganiseViewModel()
    }
}
