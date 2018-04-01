import Foundation

protocol ProjectProtocol {
    var columns:[ProjectColumn] { get set }
    var name:String { get set }
    
    func move(cardIndex:Int, to destination:Int, in columnIndex:Int)
}
