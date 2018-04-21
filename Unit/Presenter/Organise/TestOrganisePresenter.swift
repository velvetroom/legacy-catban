import XCTest
@testable import catban

class TestOrganisePresenter:XCTestCase {
    private var presenter:OrganisePresenter!
    private var factory:MockOrganisePresenterFactoryProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenter()
        self.factory = MockOrganisePresenterFactoryProtocol()
        self.presenter.factory = self.factory
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.presenter.collection, "Failed to load collection")
        XCTAssertNotNil(self.presenter.factory, "Failed to load factory")
    }
}
