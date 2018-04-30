import XCTest
@testable import catban

class TestBoardRepository_Save:XCTestCase {
    private var model:BoardRepository!
    private var project:Project!
    private var user:User!
    private var repository:MockRepositoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = BoardRepository()
        self.repository = MockRepositoryProtocol()
        self.project = Project()
        self.user = User()
        self.model.repository = self.repository
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.repository, "Failed to load repository")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.user, "Failed to load user")
    }
    
    func testSaveProject() {
        self.startExpectation()
        self.repository.onSaveProject = { [weak self] (project:ProjectProtocol) in
            let project:Project = project as! Project
            XCTAssertFalse(Thread.isMainThread, "Should not be on main thread")
            XCTAssertTrue(project === self?.project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.model.save(project:self.project)
        
        self.waitExpectation()
    }
    
    func testSaveUser() {
        self.startExpectation()
        self.repository.onSaveUser = { [weak self] (user:UserProtocol) in
            let user:User = user as! User
            XCTAssertFalse(Thread.isMainThread, "Should not be on main thread")
            XCTAssertTrue(user === self?.user, "Invalid user received")
            self?.expect?.fulfill()
        }
        
        self.model.save(user:self.user)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
