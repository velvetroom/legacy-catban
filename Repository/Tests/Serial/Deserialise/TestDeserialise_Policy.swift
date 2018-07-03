import XCTest
import Board
@testable import Repository

class TestDeserialise_Policy:XCTestCase {
    private var model:Deserialise!
    
    override func setUp() {
        super.setUp()
        self.model = Deserialise()
        self.model.data = Data()
        self.model.dictionary = [:]
        self.model.dictionary[RepositoryConstants.Keys.Shared.identifier] = "lorem ipsum"
        self.model.dictionary[RepositoryConstants.Keys.Shared.created] = 0
        self.model.dictionary[RepositoryConstants.Keys.Project.name] = "hello world"
    }
    
    func testCreateStandardProjectWithPolicy() {
        self.model.dictionary[RepositoryConstants.Keys.Shared.policy] = Policy.Project.standard.rawValue
        let project:ProjectProtocol!
        do {
            try project = self.model.loadProject()
        } catch {
            project = nil
        }
        let synched:ProjectSynchedProtocol? = project as? ProjectSynchedProtocol
        XCTAssertNotNil(project, "Failed to load project")
        XCTAssertNil(synched, "Project should NOT be synched")
    }
    
    func testCreateStandardProjectWithoutPolicy() {
        let project:ProjectProtocol!
        do {
            try project = self.model.loadProject()
        } catch {
            project = nil
        }
        let synched:ProjectSynchedProtocol? = project as? ProjectSynchedProtocol
        XCTAssertNotNil(project, "Failed to load project")
        XCTAssertNil(synched, "Project should NOT be synched")
    }
    
    func testCreateSynchedProject() {
        self.model.dictionary[RepositoryConstants.Keys.Shared.policy] = Policy.Project.synched.rawValue
        self.model.dictionary[RepositoryConstants.Keys.Synched.remoteIdentifier] = "asd"
        self.model.dictionary[RepositoryConstants.Keys.Synched.uploaded] = 0
        let project:ProjectProtocol!
        do {
            try project = self.model.loadProject()
        } catch {
            project = nil
        }
        let synched:ProjectSynchedProtocol? = project as? ProjectSynchedProtocol
        XCTAssertNotNil(project, "Failed to load project")
        XCTAssertNotNil(synched, "Project SHOULD be synched")
        if let name:String = synched?.name {
            XCTAssertFalse(name.isEmpty, "Standard information not loaded")
        }
        if let remoteIdentifier:String = synched?.remoteIdentifier {
            XCTAssertFalse(remoteIdentifier.isEmpty, "Synched information not loaded")
        }
    }
}
