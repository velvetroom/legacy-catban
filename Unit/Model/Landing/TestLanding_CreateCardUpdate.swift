import XCTest
@testable import catban

class TestLanding_CreateCardUpdate:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var update:MockUpdateFactoryProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var presenter:MockLandingPresenterProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.board = MockBoardProtocol()
        self.update = MockUpdateFactoryProtocol()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.presenter = MockLandingPresenterProtocol()
        self.model.board = self.board
        self.model.viewModelLoader = self.viewModelLoader
        self.model.presenter = self.presenter
        self.model.update = self.update
        self.model.project.columns.append(ProjectColumn())
    }
    
    func testLoad() {
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testGetUpdates() {
        self.startExpectation()
        self.update.onCreateCard = { [weak self] (indexPath:IndexPath) in
            self?.expect?.fulfill()
        }
        
        self.model.createCard()
        self.waitExpectations()
    }
    
    func testReloadViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.createCard()
        self.waitExpectations()
    }
    
    func testApplyUpdatesOnPresenter() {
        self.startExpectation()
        self.presenter.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        self.model.createProject()
        
        self.waitExpectations()
    }
    
    func testApplyUpdatesOnBoard() {
        self.startExpectation()
        self.board.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        self.model.createProject()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
