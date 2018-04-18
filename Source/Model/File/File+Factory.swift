import Foundation

extension File {
    static var rootFolder:String = Constants.rootFolder
    
    private static var rootDirectory:URL {
        get {
            return FileManager.default.urls(
                for:FileManager.SearchPathDirectory.documentDirectory,
                in:FileManager.SearchPathDomainMask.userDomainMask).last!
        }
    }
    
    class func factoryDirectory() -> URL {
        return rootDirectory.appendingPathComponent(rootFolder)
    }
}
