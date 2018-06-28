import Foundation

public protocol SynchedProtocol {
    var identifier:String { get set }
    var downloadTimestamp:Int { get set }
    var uploadTimestamp:Int { get set }
    var changeTimestamp:Int { get set }
}
