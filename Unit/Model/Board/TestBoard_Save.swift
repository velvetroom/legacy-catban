import XCTest
@testable import catban

class TestBoard_Save:XCTestCase {
    private var model:Board!
    private var repository:MockBoardRepositoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.repository = MockBoardRepositoryProtocol()
        self.model.repository = self.repository
        self.model.projects.append(Project())
        self.model.projects.append(Project())
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.repository, "Failed to load repository")
    }
    
    func testInsertProjectSaves() {
        self.startExpectation()
        self.repository.onSaveBoard = { [weak self] (board:BoardProtocol) in
            let board:Board = board as! Board
            XCTAssertTrue(board === self?.model, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.model.insertProject(project:Project())
        
        self.waitExpectation()
    }
    
    func testDeleteProjectSaves() {
        self.startExpectation()
        self.repository.onSaveBoard = { [weak self] (board:BoardProtocol) in
            let board:Board = board as! Board
            XCTAssertTrue(board === self?.model, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteProject()
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
