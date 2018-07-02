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
    
    func testStartCloudReturnsNoError() {
        let expect:XCTestExpectation = self.expectation(description:"Project not clouded")
        let project:ProjectProtocol = ProjectFactory.newProject()
        project.name = "lorem ipsum"
        self.repository.startRemote(project:project, onCompletion: { (projectSynched:ProjectSynchedProtocol) in
            do { try self.validateSynched(project:projectSynched, with:project) } catch { return }
            expect.fulfill()
        }) { (error:Error) in }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testStartCloudWithAlreadySynchedShouldReturnError() {
        let expect:XCTestExpectation = self.expectation(description:"Project not clouded")
        let project:ProjectProtocol = ProjectFactory.newProject()
        let synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        self.repository.startRemote(project:synched, onCompletion: { (projectSynched:ProjectSynchedProtocol) in })
        { (error:Error) in
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    private func validateSynched(project:ProjectSynchedProtocol, with original:ProjectProtocol) throws {
        XCTAssertEqual(project.identifier, original.identifier, "Not the same project")
        XCTAssertEqual(project.name, original.name, "Not the same project")
        XCTAssertGreaterThan(project.uploadTimestamp, 0, "Invalid timestamp")
        XCTAssertGreaterThan(project.downloadTimestamp, 0, "Invalid download timestamp")
    }
}
