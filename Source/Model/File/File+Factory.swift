import Foundation

extension File {
    private static var rootDirectory:URL {
        get {
            return FileManager.default.urls(
                for:FileManager.SearchPathDirectory.documentDirectory,
                in:FileManager.SearchPathDomainMask.userDomainMask).last!
        }
    }
    
    class func factoryDirectory() -> URL {
        return rootDirectory.appendingPathComponent(Constants.rootFolder)
    }
}
