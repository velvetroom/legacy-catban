import Foundation

extension File {
    func save(user:Data) throws {
        try user.write(to:self.user, options:Data.WritingOptions.atomic)
    }
    
    func save(project:Data, with identifier:String) throws {
        let url:URL = self.urlForProject(identifier:identifier)
        try project.write(to:url, options:Data.WritingOptions.atomic)
    }
    
    private func urlForProject(identifier:String) -> URL {
        return self.projects.appendingPathComponent(identifier).appendingPathExtension(Constants.fileExtension)
    }
}
