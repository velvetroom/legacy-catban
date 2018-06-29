import Foundation
import Board

class MockSynchedProtocol:SynchedProtocol {
    var remoteIdentifier:String
    var downloadTimestamp:Int
    var uploadTimestamp:Int
    var changeTimestamp:Int
    
    init() {
        self.remoteIdentifier = String()
        self.downloadTimestamp = 0
        self.uploadTimestamp = 0
        self.changeTimestamp = 0
    }
}
