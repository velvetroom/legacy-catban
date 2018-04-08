import XCTest
@testable import catban

class TestLanding_Cards:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
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
        self.presenter = MockLandingPresenterProtocol()
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
    
    func testCardAtIndex() {
        self.model.project = Project.factoryNewProject()
        let indexPath:IndexPath = IndexPath(item:1, section:0)
        let card:ProjectCard = self.model.project.columns[indexPath.section].cards[indexPath.item]
        
        let cardAtIndex:ProjectCard = self.model.cardAt(indexPath:indexPath)
        
        XCTAssertTrue(card === cardAtIndex, "Invalid card received")
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
    
    func testUpdateEditingCardUpdatesViewModel() {
        self.startExpectation()
        self.presenter.onUpdateViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.update(editingCard:Constants.destination)
        
        self.waitExpectation()
    }
    
    func testUpdateEditingCardUpdatesIndex() {
        XCTAssertNil(self.model.editingCard, "Initial editing card should be nil")
        self.model.update(editingCard:Constants.destination)
        XCTAssertEqual(self.model.editingCard, Constants.destination, "Failed to update editing card")
    }
    
    func testUpdateEditingCardScrollsToCard() {
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
