import Foundation

extension Project {
    func columnAt(index:Int) -> ProjectColumn {
        return self.columns[index]
    }
    
    func columnAt(indexPath:IndexPath) -> ProjectColumn {
        return self.columnAt(index:indexPath.section)
    }
}
