import XCTest
@testable import catban

class TestCollectionUpdateSalvageItemFromDeletion:XCTestCase {
    private var update:CollectionUpdateSalvageItemFromDeletion!
    private var view:MockLandingViewCollection!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let origin:IndexPath = IndexPath(item:2313, section:85413)
        static let destination:IndexPath = IndexPath(item:645, section:2423)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateSalvageItemFromDeletion()
        self.view = MockLandingViewCollection()
        self.project = MockProjectProtocol()
        self.update.origin = Constants.origin
        self.update.destination = Constants.destination
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.update.origin, "Failed to load origin")
        XCTAssertNotNil(self.update.destination, "Failed to load destination")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onMoveItem = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyProject() {
        self.startExpectation()
        self.project.onMoveCard = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(project:self.project)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
