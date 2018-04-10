import XCTest
@testable import catban

class TestCollectionUpdateProtocol:XCTestCase {
    private var update:MockCollectionUpdateProtocol!
    private var view:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.update = MockCollectionUpdateProtocol()
        self.view = MockLandingViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategy() {
        self.update.strategy(collectionView:self.view)
    }
}
