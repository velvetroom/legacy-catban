import XCTest
@testable import catban

class TestLanding_CreateColumn:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var presenter:MockLandingPresenterProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var updateFactory:MockLandingCollectionUpdateFactoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.board = MockBoardProtocol()
        self.presenter = MockLandingPresenterProtocol()
        self.updateFactory = MockLandingCollectionUpdateFactoryProtocol()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.project = MockProjectProtocol()
        self.board.project = self.project
        self.model.board = self.board
        self.model.presenter = self.presenter
        self.model.viewModelLoader = self.viewModelLoader
        self.model.update = self.updateFactory
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.updateFactory, "Failed to load update factory")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
    }
    
    func testCreateColumnGetUpdatesFromInsertColumn() {
        self.startExpectation()
        self.updateFactory.onCreateColumnIn = { [weak self] (project:ProjectProtocol) in
            let project:MockProjectProtocol? = project as? MockProjectProtocol
            XCTAssertNotNil(project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.model.createColumn()
        
        self.waitExpectations()
    }
    
    func testUpdateProject() {
        self.startExpectation()
        self.board.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        self.model.createColumn()
        
        self.waitExpectations()
    }
    
    func testUpdatePresenter() {
        self.startExpectation()
        self.presenter.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        self.model.createColumn()
        
        self.waitExpectations()
    }
    
    func testReloadViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.createColumn()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
