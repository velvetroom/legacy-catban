import Foundation

protocol ProjectProtocol {
    var columns:[ProjectColumn] { get set }
    var name:String { get set }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
    func indexOnRightForCardAt(index:IndexPath) -> IndexPath
    func indexOnLeftForCardAt(index:IndexPath) -> IndexPath
}
