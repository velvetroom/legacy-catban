import Foundation
import Board

public extension Repository {
    public func localSave(project:ProjectProtocol) {
        self.dispatchQueue.async {
            self.backgroundSave(project:project)
        }
    }
    
    public func localDelete(project:ProjectProtocol) {
        self.dispatchQueue.async {
            self.backgroundDelete(project:project)
        }
    }
    
    private func backgroundSave(project:ProjectProtocol) {
        let serialise:SerialiseProtocol = Serialise()
        do {
            let data:Data = try serialise.makeDataFrom(project:project)
            try self.file.writeProject(data:data, with:project.identifier)
        } catch { }
    }
    
    private func backgroundDelete(project:ProjectProtocol) {
        do { try self.file.deleteProjectWith(identifier:project.identifier) } catch { }
    }
}
