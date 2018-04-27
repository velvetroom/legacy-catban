import Foundation

protocol ProjectProtocol {
    var columns:[ProjectColumn] { get set }
    var history:HistoryProtocol { get set }
    var name:String { get set }
    var identifier:String { get set }
    var totalCards:Int { get }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard
    func columnAt(index:Int) -> ProjectColumn
    func columnAt(indexPath:IndexPath) -> ProjectColumn
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
    func indexFor(column:ProjectColumn) -> Int
    func indexOnRightForCardAt(index:IndexPath) -> IndexPath
    func indexOnLeftForCardAt(index:IndexPath) -> IndexPath
    func indexForNewCard() -> IndexPath
    func insert(card:ProjectCard, at indexPath:IndexPath)
    func insert(column:ProjectColumn, at index:Int)
    func deleteCardAt(indexPath:IndexPath)
    func deleteColumnAt(index:Int)
}
