import Foundation

protocol ProjectProtocol {
    var columns:[ProjectColumn] { get set }
    var name:String { get set }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard
    func columnAt(index:Int) -> ProjectColumn
    func columnAt(indexPath:IndexPath) -> ProjectColumn
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
    func indexFor(column:ProjectColumn) -> Int
    func indexOnRightForCardAt(index:IndexPath) -> IndexPath
    func indexOnLeftForCardAt(index:IndexPath) -> IndexPath
    func reorderingIndexesForCardsInColumn(index:Int) -> [IndexPath]
    func indexForNewCard() -> IndexPath
    func insert(card:ProjectCard, at indexPath:IndexPath)
    func deleteCardAt(indexPath:IndexPath)
    func deleteColumnAt(index:Int)
}
