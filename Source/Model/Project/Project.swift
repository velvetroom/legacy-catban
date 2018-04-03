import Foundation

class Project:ProjectProtocol {
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
    }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard {
        return columnAt(index:indexPath.section).cardAt(index:indexPath.item)
    }
    
    func columnAt(index:Int) -> ProjectColumn {
        return self.columns[index]
    }
    
    func columnAt(indexPath:IndexPath) -> ProjectColumn {
        return self.columnAt(index:indexPath.section)
    }
}
