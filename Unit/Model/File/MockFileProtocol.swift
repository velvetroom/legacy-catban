import Foundation
@testable import catban

class MockFileProtocol:FileProtocol {
    var onLoadUser:(() -> Void)?
    var onLoadProjects:(() -> Void)?
    var throwError:Error?
    
    func loadUser() throws -> Data {
        self.onLoadUser?()
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return Data()
    }
    
    func loadProjects() throws -> [Data] {
        self.onLoadProjects?()
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return [Data()]
    }
}
