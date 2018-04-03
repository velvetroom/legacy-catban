import Foundation

protocol ProjectProtocol {
    var columns:[ProjectColumn] { get set }
    var name:String { get set }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard
    func columnAt(index:Int) -> ProjectColumn
    func columnAt(indexPath:IndexPath) -> ProjectColumn
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
    func indexOnRightForCardAt(index:IndexPath) -> IndexPath
    func indexOnLeftForCardAt(index:IndexPath) -> IndexPath
}
