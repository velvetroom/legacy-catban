import Foundation
@testable import catban

class MockSerialiserProtocol:SerialiserProtocol {
    var onSerialiserUser:((UserProtocol) -> Void)?
    var onSerialiserProject:((ProjectProtocol) -> Void)?
    var returnSerialisedData:Data
    
    init() {
        self.returnSerialisedData = Data()
    }
    
    func serialise(user:UserProtocol) throws -> Data {
        self.onSerialiserUser?(user)
        return self.returnSerialisedData
    }
    
    func serialise(project:ProjectProtocol) throws -> Data {
        self.onSerialiserProject?(project)
        return self.returnSerialisedData
    }
}
