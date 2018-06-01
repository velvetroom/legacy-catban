import Foundation
@testable import Repository

class FileLoader {
    class func load(fileNamed:String) -> Data? {
        guard
            let fileURL:URL = Bundle(for:self).url(
                forResource:fileNamed, withExtension:RepositoryConstants.Url.fileExtension)
        else { return nil }
        return self.dataWith(url:fileURL)
    }
    
    private class func dataWith(url:URL) -> Data? {
        let data:Data
        do {
            try data = Data(contentsOf:url)
        } catch {
            return nil
        }
        return data
    }
}
