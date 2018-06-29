import Foundation

public extension SynchedProtocol {
    var needsSync:Bool {
        get {
            return self.changeTimestamp > self.uploadTimestamp
        }
    }
}
