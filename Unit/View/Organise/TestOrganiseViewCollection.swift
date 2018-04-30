import XCTest
@testable import catban

class TestOrganiseViewCollection:XCTestCase {
    private var view:OrganiseViewCollection!
    
    override func setUp() {
        super.setUp()
        self.view = OrganiseViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testFactoryLayout() {
        let layout:UICollectionViewFlowLayout = OrganiseViewCollection.factoryLayout()
        XCTAssertNotNil(layout, "Failed to factory layout")
    }
}
