import XCTest
@testable import catban

class TestLanding_ApplyUpdates:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var presenter:MockLandingPresenterProtocol!
    private var update:MockUpdateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.board = MockBoardProtocol()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.presenter = MockLandingPresenterProtocol()
        self.update = MockUpdateProtocol()
        self.model.board = self.board
        self.model.viewModelLoader = self.viewModelLoader
        self.model.presenter = self.presenter
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testReloadViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.applyUpdates(updates:[self.update])
        self.waitExpectations()
    }
    
    func testApplyUpdatesOnPresenter() {
        self.startExpectation()
        self.presenter.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            let update:MockUpdateProtocol = updates.first as! MockUpdateProtocol
            XCTAssertTrue(update === self?.update, "Invalid updates")
            self?.expect?.fulfill()
        }
        
        self.model.applyUpdates(updates:[self.update])
        
        self.waitExpectations()
    }
    
    func testApplyUpdatesOnBoard() {
        self.startExpectation()
        self.board.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            let update:MockUpdateProtocol = updates.first as! MockUpdateProtocol
            XCTAssertTrue(update === self?.update, "Invalid updates")
            self?.expect?.fulfill()
        }
        
        self.model.applyUpdates(updates:[self.update])
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
