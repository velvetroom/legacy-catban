import Foundation
@testable import Repository

class FileLoader {
    class func load(fileNamed:String) -> Data {
        let fileURL:URL = Bundle(for:self).url(
            forResource:fileNamed, withExtension:RepositoryConstants.Url.fileExtension)!
        return self.dataWith(url:fileURL)
    }
    
    private class func dataWith(url:URL) -> Data {
        var data:Data!
        do { try data = Data(contentsOf:url) } catch { }
        return data
    }
}
