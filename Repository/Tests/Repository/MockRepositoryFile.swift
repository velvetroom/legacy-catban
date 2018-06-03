import Foundation
@testable import Repository

class MockRepositoryFile:RepositoryFile {
    var onDeleteProject:((String) -> Void)?
    
    override func deleteProjectWith(identifier:String) throws {
        self.onDeleteProject?(identifier)
    }
}
