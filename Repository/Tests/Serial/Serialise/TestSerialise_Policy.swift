import XCTest
import Board
@testable import Repository

class TestSerialise_Policy:XCTestCase {
    private var model:Serialise!
    
    override func setUp() {
        super.setUp()
        self.model = Serialise()
    }
    
    func testMakesDictionaryWithPolicyInformation() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.model.makeDictionaryFrom(project:project)
        let policy:String? = self.model.dictionary[RepositoryConstants.Keys.Shared.policy] as? String
        XCTAssertNotNil(policy, "Failed to store policy")
    }
    
    func testMakesDictionaryWithSynchedInformation() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        self.model.makeDictionaryFrom(project:synched)
        let remoteIdentifier:String? = self.model.dictionary[RepositoryConstants.Keys.Synched.remoteIdentifier] as? String
        let uploaded:Int? = self.model.dictionary[RepositoryConstants.Keys.Synched.uploaded] as? Int
        XCTAssertNotNil(remoteIdentifier, "Failed to store synched information")
        XCTAssertNotNil(uploaded, "Failed to store synched information")
    }
}
