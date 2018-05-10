import Foundation

public protocol CardManagerProtocol {
    var countCards:Int { get }
    
    func cardWith(identifier:String) -> CardProtocol?
}
