import XCTest
@testable import catban

class TestStatsViewCollectionLayout:XCTestCase {
    private var layout:StatsViewCollectionLayout!
    private var collection:MockStatsViewCollectionLayoutCollection!
    private struct Constants {
        static let rect:CGRect = CGRect(x:0, y:0, width:456, height:654)
        static let items:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.collection = MockStatsViewCollectionLayoutCollection()
        self.layout = self.collection.layout
        self.collection.frame = Constants.rect
        self.collection.numberOfItems = Constants.items
        self.layout.prepare()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.layout, "Failed to load layout")
        XCTAssertNotNil(self.collection, "Failed to load collection")
        XCTAssertNotNil(self.layout.attributes, "Failed to load attributes")
    }
    
    func testTotalItems() {
        XCTAssertEqual(self.layout.attributes.count, Constants.items, "Invalid number of items")
    }
    
    func testIndexPath() {
        for index:Int in 0 ..< Constants.items {
            let indexPath:IndexPath = self.layout.attributes[index].indexPath
            XCTAssertEqual(indexPath.item, index, "Invalid index")
            XCTAssertEqual(indexPath.section, 0, "Invalid section")
        }
    }
    
    func testFrame() {
        for index:Int in 0 ..< Constants.items {
            let rect:CGRect = self.layout.attributes[index].frame
            XCTAssertEqual(rect.width, Constants.rect.width, "Invalid width")
            XCTAssertEqual(rect.height, Constants.rect.height, "Invalid height")
        }
    }
    
    func testLayoutAttributesForItem() {
        let attributes:UICollectionViewLayoutAttributes? = self.layout.layoutAttributesForItem(
            at:IndexPath(item:1, section:0))
        XCTAssertEqual(attributes, self.layout.attributes[1], "Invalid attributes returned")
    }
}
