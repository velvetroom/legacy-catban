import XCTest
@testable import catban

class TestLanding_CreateCard:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var collection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.presenter = MockLandingPresenterProtocol()
        self.collection = MockLandingViewCollection()
        self.presenter.outlets.list.viewCollection = self.collection
        self.model.presenter = self.presenter
        self.model.project = project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.presenter, "Failed to load project")
        XCTAssertNotNil(self.collection, "Failed to load project")
    }
    
    func testCreateCard() {
        self.startExpectation()
        self.project.onIndexForNewCard = { [weak self] (index:IndexPath) in
            self?.expect?.fulfill()
        }
        
        self.model.createCard()
        self.waitExpectations()
    }
    
    func testUpdateEditingIndexAtCreate() {
        self.startExpectation()
        var createdCard:IndexPath?
        self.project.onIndexForNewCard = { (index:IndexPath) in
            createdCard = index
        }
        self.project.onInsertCardAt = { [weak self] (card:ProjectCard, index:IndexPath) in
            guard
                let editingCard:IndexPath = self?.model.editingCard,
                let createdCard:IndexPath = createdCard
            else { return }
            XCTAssertEqual(editingCard, createdCard, "Failed to assign editing card")
            XCTAssertEqual(index, createdCard, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.createCard()
        self.waitExpectations()
    }
    
    func testCreateCardScrollsToEditingCard() {
        self.startExpectation()
        var createdCard:IndexPath?
        self.project.onIndexForNewCard = { (index:IndexPath) in
            createdCard = index
        }
        self.collection.onScrollToItem = { [weak self] (index:IndexPath) in
            XCTAssertEqual(index, createdCard, "Failed to assign editing card")
            self?.expect?.fulfill()
        }
        
        self.model.createCard()
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
