import XCTest
@testable import catban

class TestStatsViewCollection:XCTestCase {
    private var view:StatsViewCollection!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testFactoryLayout() {
        let layout:UICollectionViewFlowLayout = OrganiseViewCollection.factoryLayout()
        XCTAssertNotNil(layout, "Failed to factory layout")
    }
}
