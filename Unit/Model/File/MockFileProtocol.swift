import Foundation
@testable import catban

class MockFileProtocol:FileProtocol {
    var onLoadUser:(() -> Void)?
    var onLoadProjects:(() -> Void)?
    
    func loadUser() throws -> Data {
        self.onLoadUser?()
        return Data()
    }
    
    func loadProjects() throws -> [Data] {
        self.onLoadProjects?()
        return []
    }
}
