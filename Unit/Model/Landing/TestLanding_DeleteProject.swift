import XCTest
@testable import catban

class TestLanding_DeleteProject:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var updateFactory:MockUpdateFactoryProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var presenter:MockLandingPresenterProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let identifierOne:String = "hello world"
        static let identifierTwo:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.board = MockBoardProtocol()
        self.updateFactory = MockUpdateFactoryProtocol()
        self.presenter = MockLandingPresenterProtocol()
        let projectOne:Project = Project()
        projectOne.identifier = Constants.identifierOne
        let projectTwo:Project = Project()
        projectTwo.identifier = Constants.identifierTwo
        self.board.projects = [
            projectOne,
            projectTwo]
        self.model.board = self.board
        self.model.viewModelLoader = self.viewModelLoader
        self.model.presenter = self.presenter
        self.model.update = self.updateFactory
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.updateFactory, "Failed to load update factory")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testNoThrowsWhenMoreThanOneProject() {
        XCTAssertNoThrow(try self.model.deleteProject(), "Failed to delete project")
    }
    
    func testFactoryUpdates() {
        self.startExpectation()
        self.updateFactory.onDeleteProject = { [weak self] (board:BoardProtocol) in
            let board:MockBoardProtocol = board as! MockBoardProtocol
            XCTAssertTrue(board === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.deleteProject() } catch { }
        
        self.waitExpectations()
    }
    
    func testApplyUpdatesOnBoard() {
        self.startExpectation()
        self.board.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        do { try self.model.deleteProject() } catch { }
        
        self.waitExpectations()
    }
    
    func testReloadViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        do { try self.model.deleteProject() } catch { }
        
        self.waitExpectations()
    }
    
    func testApplyUpdatesOnPresenter() {
        self.startExpectation()
        self.presenter.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        do { try self.model.deleteProject() } catch { }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
