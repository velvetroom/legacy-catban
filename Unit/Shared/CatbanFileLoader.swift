import Foundation

class CatbanFileLoader {
    class func loadWith(name:String) -> Data? {
        guard
            let fileURL:URL = Bundle.main.url(forResource:name, withExtension:Constants.fileExtension)
        else {
            return nil
        }
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
