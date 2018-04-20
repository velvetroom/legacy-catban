import XCTest
@testable import catban

class TestOrganisePresenterCollectionDatasource:XCTestCase {
    private var presenter:OrganisePresenterCollectionDatasource!
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenterCollectionDatasource()
    }
}
