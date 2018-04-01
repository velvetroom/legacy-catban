import Foundation

protocol ProjectProtocol {
    var columns:[ProjectColumn] { get set }
    var name:String { get set }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
}
