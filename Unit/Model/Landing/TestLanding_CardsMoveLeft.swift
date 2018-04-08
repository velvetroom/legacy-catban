import XCTest
@testable import catban

class TestLanding_CardsMoveLeft:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var collection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let editingCard:IndexPath = IndexPath(item:0, section:0)
        static let returnIndex:IndexPath = IndexPath(item:9023, section:342)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.presenter = MockLandingPresenterProtocol()
        self.collection = MockLandingViewCollection()
        self.project.indexForCard = Constants.returnIndex
        self.model.project = self.project
        self.model.presenter = self.presenter
        self.model.editingCard = Constants.editingCard
        self.model.presenter.outlets.list.viewCollection = self.collection
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.model.editingCard, "Failed to load editing card")
        XCTAssertNotNil(self.collection, "Failed to load collection")
    }
    
    func testMoveEditingCardLefgtAskForIndex() {
        self.startExpectation()
        self.project.onIndexForCard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.moveEditingCardLeft()
        
        self.waitExpectation()
    }
    
    func testMoveEditingCardLeftMoveCard() {
        self.startExpectation()
        self.project.onMoveCard = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.editingCard, "Invalid origin")
            XCTAssertEqual(destination, Constants.returnIndex, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.model.moveEditingCardLeft()
        
        self.waitExpectation()
    }
    
    func testMoveEditingCardLeftUpdateViewModel() {
        self.startExpectation()
        self.presenter.onUpdateViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.moveEditingCardLeft()
        
        self.waitExpectation()
    }
    
    func testMoveEditingCardLeftUpdateCollection() {
        self.startExpectation()
        self.collection.onMoveItem = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.editingCard, "Invalid origin")
            XCTAssertEqual(destination, Constants.returnIndex, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.model.moveEditingCardLeft()
        
        self.waitExpectation()
    }
    
    func testMoveEditingCardLeftScrollsCollection() {
        self.startExpectation()
        self.collection.onScrollToItem = { [weak self] (scrollItem:IndexPath) in
            XCTAssertEqual(scrollItem, Constants.returnIndex, "Invalid scroll item")
            self?.expect?.fulfill()
        }
        
        self.model.moveEditingCardLeft()
        
        self.waitExpectation()
    }
    
    func testMoveEditingCardLeftUpdatesEditingCard() {
        self.model.moveEditingCardLeft()
        XCTAssertEqual(self.model.editingCard, Constants.returnIndex, "Failed to update editing card")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
