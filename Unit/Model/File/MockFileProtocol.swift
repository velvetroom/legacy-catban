import Foundation
@testable import catban

class MockFileProtocol:FileProtocol {
    var onLoadUser:(() -> Void)?
    var onLoadProjects:(() -> Void)?
    var onSaveUser:((UserProtocol) -> Void)?
    var onSaveProjects:(([ProjectProtocol]) -> Void)?
    var throwError:Error?
    var directory:URL
    var projects:URL {
        get {
            return self.directory
        }
    }
    
    private struct Constants {
        static let urlString:String = "www.google.com"
    }
    
    init() {
        self.directory = URL(string:Constants.urlString)!
    }
    
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
    
    func save(user:UserProtocol) throws {
        self.onSaveUser?(user)
    }
    
    func save(projects:[ProjectProtocol]) throws {
        self.onSaveProjects?(projects)
    }
}
