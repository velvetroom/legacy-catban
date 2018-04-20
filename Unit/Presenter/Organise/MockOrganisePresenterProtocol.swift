import Foundation
@testable import catban

class MockOrganisePresenterProtocol:OrganisePresenterProtocol {
    var outlets:OrganisePresenterOutlets
    var collection:OrganisePresenterCollection
    
    init() {
        self.outlets = OrganisePresenterOutlets()
        self.collection = OrganisePresenterCollection()
    }
}
