import Foundation
import Board

extension Serialise {
    func makeDictionaryFrom(project:ProjectProtocol) {
        let policy:Policy.Project = PolicyFactory.makeProjectWith(project:project)
        self.dictionary[RepositoryConstants.Keys.Shared.policy] = policy.rawValue
        self.policyMap()[policy]!(project)
    }
    
    private func policyMap() -> [Policy.Project:((ProjectProtocol) -> Void)] {
        return [
            Policy.Project.standard : self.makeStandardWith,
            Policy.Project.synched : self.makeSynchedWith]
    }
    
    private func makeSynchedWith(project:ProjectProtocol) {
        let synched:ProjectSynchedProtocol = project as! ProjectSynchedProtocol
        self.dictionary[RepositoryConstants.Keys.Synched.remoteIdentifier] = synched.remoteIdentifier
        self.dictionary[RepositoryConstants.Keys.Synched.uploaded] = synched.uploaded
        self.makeStandardWith(project:project)
    }
    
    private func makeStandardWith(project:ProjectProtocol) {
        self.dictionary[RepositoryConstants.Keys.Shared.identifier] = project.identifier
        self.dictionary[RepositoryConstants.Keys.Shared.created] = project.created
        self.dictionary[RepositoryConstants.Keys.Project.name] = project.name
        self.dictionary[RepositoryConstants.Keys.Project.columns] = self.makeColumnArrayFrom(project:project)
    }
}
