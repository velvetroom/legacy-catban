import XCTest
@testable import catban

class TestLanding_Scroll:XCTestCase {
    private var model:Landing!
    private var view:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let indexPath:IndexPath = IndexPath(item:412423, section:34221)
        static let viewFrame:CGRect = CGRect(x:0, y:0, width:500, height:500)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.view = MockLandingViewCollection()
        self.model.presenter.outlets.list.viewCollection = self.view
        self.model.editingCard = Constants.indexPath
        self.view.contentSize = Constants.viewFrame.size
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testScrollToIndexPath() {
        self.startExpectation()
        self.view.onScrollToItem = { [weak self] (indexPath:IndexPath) in
            XCTAssertEqual(indexPath, Constants.indexPath, "Invalid index path received")
            self?.expect?.fulfill()
        }
        
        self.model.scrollToEditingCard()
        
        self.waitExpectation()
    }
    
    func testScrollToTopRightCorner() {
        self.startExpectation()
        let expectedRect:CGRect = CGRect(x:Constants.viewFrame.maxX - 1, y:0, width:1, height:1)
        self.view.onScrollToRect = { [weak self] (rect:CGRect, animated:Bool) in
            XCTAssertEqual(rect, expectedRect, "Invalid rect received for scrolling")
            XCTAssertTrue(animated, "Scrolling should be animated")
            self?.expect?.fulfill()
        }
        
        self.model.scrollToTopRightCorner()
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
