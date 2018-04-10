import Foundation

extension Project {
    func indexFor(column:ProjectColumn) -> Int {
        var foundIndex:Int = 0
        let count:Int = self.columns.count
        for index:Int in 0 ..< count {
            if self.columns[index] === column {
                foundIndex = index
                break
            }
        }
        return foundIndex
    }
    
    func columnAt(index:Int) -> ProjectColumn {
        return self.columns[index]
    }
    
    func columnAt(indexPath:IndexPath) -> ProjectColumn {
        return self.columnAt(index:indexPath.section)
    }
    
    func deleteColumnAt(index:Int) {
        self.columns.remove(at:index)
    }
    
    func reorderingIndexesForCardsInColumn(index:Int) -> [IndexPath] {
        return []
    }
}
