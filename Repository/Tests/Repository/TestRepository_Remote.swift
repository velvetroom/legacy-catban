import XCTest
import Board
import Shared
@testable import Repository

class TestRepository_Remote:XCTestCase {
    private var repository:Repository!
    private var remote:MockRemoteProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.repository = Repository()
        self.remote = MockRemoteProtocol()
        self.repository.remote = self.remote
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
    
    func testSaveReturnsNoError() {
        let expect:XCTestExpectation = self.expectation(description:"Project not saved")
        let project:ProjectProtocol = ProjectFactory.newProject()
        let synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        self.repository.remoteSave(project:synched, onCompletion: {
            expect.fulfill()
        }, onError: { (error:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveUpdatesUploaded() {
        let expect:XCTestExpectation = self.expectation(description:"Project not saved")
        let project:ProjectProtocol = ProjectFactory.newProject()
        var synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        synched.uploaded = 0
        self.repository.remoteSave(project:synched, onCompletion: {
            XCTAssertGreaterThan(synched.uploaded, 0, "Uploaded not updated")
            expect.fulfill()
        }, onError: { (error:Error) in })
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    private func validateSynched(project:ProjectSynchedProtocol, with original:ProjectProtocol) throws {
        XCTAssertEqual(project.identifier, original.identifier, "Not the same project")
        XCTAssertEqual(project.name, original.name, "Not the same project")
        XCTAssertGreaterThan(project.uploaded, 0, "Invalid timestamp")
    }
}
