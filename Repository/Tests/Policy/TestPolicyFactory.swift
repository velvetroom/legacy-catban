import XCTest
import Board
@testable import Repository

class TestPolicyFactory:XCTestCase {
    func testMakePolicyWithNilString() {
        let policy:Policy.Project = PolicyFactory.makeProjectWith(string:nil)
        XCTAssertEqual(policy, Policy.Project.standard, "Invalid policy")
    }
    
    func testMakePolicyWithEmptyString() {
        let policy:Policy.Project = PolicyFactory.makeProjectWith(string:String())
        XCTAssertEqual(policy, Policy.Project.standard, "Invalid policy")
    }
    
    func testMakePolicyStandard() {
        let policy:Policy.Project = PolicyFactory.makeProjectWith(string:Policy.Project.standard.rawValue)
        XCTAssertEqual(policy, Policy.Project.standard, "Invalid policy")
    }
    
    func testMakePolicySynched() {
        let policy:Policy.Project = PolicyFactory.makeProjectWith(string:Policy.Project.synched.rawValue)
        XCTAssertEqual(policy, Policy.Project.synched, "Invalid policy")
    }
    
    func testMakePolicyWithProject() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let policy:Policy.Project = PolicyFactory.makeProjectWith(project:project)
        XCTAssertEqual(policy, Policy.Project.standard, "Invalid policy")
    }
    
    func testMakePolicyWithSynchedProject() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        let policy:Policy.Project = PolicyFactory.makeProjectWith(project:synched)
        XCTAssertEqual(policy, Policy.Project.synched, "Invalid policy")
    }
}
