import XCTest
@testable import catban

class TestLandingViewCollection_Factory:XCTestCase {
    private var layout:UICollectionViewFlowLayout!
    
    override func setUp() {
        super.setUp()
        self.layout = LandingViewCollection.factoryLayout()
    }
    
    func testFactoryLayout() {
        XCTAssertNotNil(self.layout, "Failed to factory layout")
    }
}
