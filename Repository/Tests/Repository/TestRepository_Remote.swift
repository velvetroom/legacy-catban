import XCTest
import Board
import Shared
@testable import Repository

class TestRepository_Remote:XCTestCase {
    private var repository:Repository!
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.repository = Repository()
    }
    
    func testStartsCloudReturnsNoError() {
        let expect:XCTestExpectation = self.expectation(description:"Project not clouded")
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.repository.startRemote(project:project, onCompletion: { (projectSynched:ProjectSynchedProtocol) in
            do { try self.validateSynched(project:projectSynched) } catch { return }
            expect.fulfill()
        }) { (error:Error) in }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    private func validateSynched(project:ProjectSynchedProtocol) throws {
        
    }
}
