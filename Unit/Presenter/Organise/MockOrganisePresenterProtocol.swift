import Foundation
@testable import catban

class MockOrganisePresenterProtocol:OrganisePresenterProtocol {
    var outlets:OrganisePresenterOutlets
    
    init() {
        self.outlets = OrganisePresenterOutlets()
    }
}
