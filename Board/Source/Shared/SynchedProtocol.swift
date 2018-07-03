import Foundation

public protocol SynchedProtocol {
    var remoteIdentifier:String { get set }
    var uploaded:Int { get set }
}
