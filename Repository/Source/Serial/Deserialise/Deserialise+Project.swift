import Foundation
import Board

extension Deserialise {
    func loadProject() throws -> ProjectProtocol {
        let policy:Policy.Project = self.loadPolicy()
        return try self.policyMap()[policy]!()
    }
    
    private func loadPolicy() -> Policy.Project {
        let rawPolicy:String? = self.dictionary[RepositoryConstants.Keys.Shared.policy] as? String
        return PolicyFactory.makeProjectWith(string:rawPolicy)
    }
    
    private func policyMap() -> [Policy.Project:(() throws -> ProjectProtocol)] {
        return [
            Policy.Project.standard : self.loadStandard,
            Policy.Project.synched : self.loadSynched]
    }
    
    private func loadStandard() throws -> ProjectProtocol {
        let project:ProjectProtocol = ProjectFactory.blankProject()
        try self.loadWith(project:project)
        return project
    }
    
    private func loadSynched() throws -> ProjectProtocol {
        let project:ProjectProtocol = ProjectFactory.blankProject()
        var synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        synched.remoteIdentifier = try self.valueWith(key:RepositoryConstants.Keys.Synched.remoteIdentifier)
        synched.uploaded = try self.valueWith(key:RepositoryConstants.Keys.Synched.uploaded)
        try self.loadWith(project:synched)
        return synched
    }
    
    private func loadWith(project:ProjectProtocol) throws {
        var project:ProjectProtocol = project
        project.identifier = try self.getIdentifier()
        project.name = try self.valueWith(key:RepositoryConstants.Keys.Project.name)
        project.created = try self.valueWith(key:RepositoryConstants.Keys.Shared.created)
    }
}
