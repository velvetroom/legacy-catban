import XCTest
@testable import catban

class TestLanding_Cards:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenter!
    private var collection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let origin:IndexPath = IndexPath(item:4, section:6)
        static let destination:IndexPath = IndexPath(item:7, section:8)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.presenter = MockLandingPresenter()
        self.collection = MockLandingViewCollection()
        self.model.project = self.project
        self.model.presenter = self.presenter
        self.presenter.outlets.list.viewCollection = self.collection
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.collection, "Failed to load collection")
    }
    
    func testReorderItemCallsMoveOnProject() {
        self.startExpectation()
        self.project.onMoveCard = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        
        self.waitExpectation()
    }
    
    func testReloadViewModelOnReorderItem() {
        self.startExpectation()
        self.presenter.onUpdateViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        
        self.waitExpectation()
    }
    
    func testUpdateEditingCard() {
        self.startExpectation()
        self.collection.onScrollToItem = { [weak self] (editingCard:IndexPath) in
            XCTAssertEqual(editingCard, Constants.destination, "Scrolling to invalid index path")
            self?.expect?.fulfill()
        }
        
        self.model.update(editingCard:Constants.destination)
        
        self.waitExpectation()
    }
    
    func testScrollToEditingCard() {
        self.startExpectation()
        self.model.editingCard = Constants.destination
        self.collection.onScrollToItem = { [weak self] (editingCard:IndexPath) in
            XCTAssertEqual(editingCard, Constants.destination, "Scrolling to invalid index path")
            self?.expect?.fulfill()
        }
        
        self.model.scrollToEditingCard()
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
