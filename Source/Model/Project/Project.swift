import Foundation

class Project:ProjectProtocol {
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
    }
    
    func columnAt(index:Int) -> ProjectColumn {
        return self.columns[index]
    }
    
    func columnAt(indexPath:IndexPath) -> ProjectColumn {
        return self.columnAt(index:indexPath.section)
    }
}
