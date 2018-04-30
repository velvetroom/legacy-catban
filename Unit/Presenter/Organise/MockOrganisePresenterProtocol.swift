import Foundation
@testable import catban

class MockOrganisePresenterProtocol:OrganisePresenterProtocol {
    var onUpdateWithBoard:((BoardProtocol) -> Void)?
    var factory:OrganisePresenterFactoryProtocol
    var outlets:OrganisePresenterOutlets
    var collection:OrganisePresenterCollection
    
    init() {
        self.factory = OrganisePresenterFactory()
        self.outlets = OrganisePresenterOutlets()
        self.collection = OrganisePresenterCollection()
    }
    
    func updateWith(board:BoardProtocol) {
        self.onUpdateWithBoard?(board)
    }
}
