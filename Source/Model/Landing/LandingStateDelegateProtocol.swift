import Foundation

protocol LandingStateDelegateProtocol:AnyObject {
    var project:ProjectProtocol { get set }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
}
