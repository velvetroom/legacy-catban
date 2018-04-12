import XCTest
@testable import catban

class TestCollectionUpdateProtocol:XCTestCase {
    private var update:MockCollectionUpdateProtocol!
    private var project:Project!
    private var view:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.update = MockCollectionUpdateProtocol()
        self.project = Project()
        self.view = MockLandingViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategy() {
        self.update.strategy(project:self.project)
        self.update.strategy(collectionView:self.view)
    }
}
