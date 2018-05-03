import XCTest
@testable import catban

class TestLanding_UpdateCard:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let text:String = "lorem ipsum"
        static let indexPath:IndexPath = IndexPath(item:1, section:0)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.presenter = MockLandingPresenterProtocol()
        self.board = MockBoardProtocol()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.model.board = self.board
        self.model.presenter = self.presenter
        self.model.viewModelLoader = self.viewModelLoader
        self.model.editingCard = Constants.indexPath
        let cardA:ProjectCard = ProjectCard()
        let cardB:ProjectCard = ProjectCard()
        let column:ProjectColumn = ProjectColumn()
        column.cards.append(cardA)
        column.cards.append(cardB)
        self.model.project.columns.append(column)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
    }
    
    func testUpdateEditingCardCallsPresenter() {
        self.startExpectation()
        self.presenter.onUpdateCardAtIndex = { [weak self] (indexReceived:IndexPath) in
            XCTAssertEqual(Constants.indexPath, indexReceived, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.updateCard(title:Constants.text)
        self.waitExpectation()
    }
    
    func testViewModelGetsUpdatedOnUpdateCard() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.updateCard(title:Constants.text)
        self.waitExpectation()
    }
    
    func testUpdatesTitle() {
        self.model.editingCardReference?.title = String()
        self.model.updateCard(title:Constants.text)
        XCTAssertEqual(self.model.editingCardReference?.title, Constants.text, "Failed to update title")
    }
    
    func testSavesProject() {
        self.startExpectation()
        self.board.onSaveProject = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.updateCard(title:Constants.text)
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
