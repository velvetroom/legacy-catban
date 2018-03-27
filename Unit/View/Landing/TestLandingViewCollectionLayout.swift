import XCTest
@testable import catban

class TestLandingViewCollectionLayout:XCTestCase {
    private var layout:LandingViewCollectionLayout!
    private var viewModel:LandingViewModelCollectionLayout!
    private var headerRect:CGRect!
    private var offsetRect:CGRect!
    private struct Constants {
        static let headerWidth:CGFloat = 100
        static let headerHeight:CGFloat = 100
    }
    
    override func setUp() {
        super.setUp()
        self.createRects()
        self.layout = LandingViewCollectionLayout()
        self.viewModel = self.factoryViewModel()
        self.layout.viewModel = self.viewModel
    }
    
    func testLoad() {
        XCTAssertNotNil(self.layout, "Failed to load layout")
        XCTAssertNotNil(self.layout.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.layout.cellAttributes, "Failed to load cell attributes")
        XCTAssertNotNil(self.layout.headersAttributes, "Failed to load header attributes")
    }
    
    func testPrepareCreatesAttributes() {
        XCTAssertTrue(self.layout.attributesList.isEmpty, "Attributes list should be empty")
        self.layout.prepare()
        XCTAssertTrue(self.layout.attributesList.count == 1, "Failed to prepare attributes")
    }
    
    func testAttributesForElementsInRectFails() {
        self.layout.prepare()
        let attributesList:[UICollectionViewLayoutAttributes]? = self.layout.layoutAttributesForElements(
            in:self.offsetRect)
        XCTAssertNil(attributesList, "No attributes should be found")
    }
    
    func testAttributesForElementsInRectSucceedes() {
        self.layout.prepare()
        let attributesList:[UICollectionViewLayoutAttributes]? = self.layout.layoutAttributesForElements(
            in:self.headerRect)
        XCTAssertNotNil(attributesList, "Failing finding attributes")
        XCTAssertFalse(attributesList!.isEmpty, "No attributes found")
        guard
            let attributes:UICollectionViewLayoutAttributes = attributesList?.first
        else {
            return
        }
        XCTAssertTrue(attributes.frame == self.headerRect, "Invalid header rect")
    }
    
    private func createRects() {
        self.headerRect = CGRect(x:0, y:0, width:Constants.headerWidth, height:Constants.headerHeight)
        self.offsetRect = CGRect(x:Constants.headerWidth + 1,
                                 y:Constants.headerHeight + 1,
                                 width:Constants.headerWidth,
                                 height:Constants.headerHeight)
    }
    
    private func factoryViewModel() -> LandingViewModelCollectionLayout {
        var viewModel:LandingViewModelCollectionLayout = LandingViewModelCollectionLayout()
        var header:LandingViewModelCollectionLayoutHeader = LandingViewModelCollectionLayoutHeader()
        header.frame = self.headerRect
        viewModel.headers.append(header)
        return viewModel
    }
}
