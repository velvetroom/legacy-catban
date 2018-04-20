import Foundation

class CatbanFileLoader {
    static var bundle:Bundle {
        get {
            return Bundle(for:CatbanFileLoader.self)
        }
    }
    
    class func loadWith(name:String) -> Data? {
        guard
            let fileURL:URL = bundle.url(forResource:name, withExtension:Constants.fileExtension)
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
