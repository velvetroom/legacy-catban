import Foundation

public protocol CardManagerProtocol {
    var countCards:Int { get }
    
    func add(card:CardProtocol)
    func cardWith(identifier:String) -> CardProtocol
    func remove(card:CardProtocol)
}
