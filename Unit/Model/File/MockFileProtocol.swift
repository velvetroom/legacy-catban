import Foundation
@testable import catban

class MockFileProtocol:FileProtocol {
    var onLoadUser:(() -> Void)?
    var onLoadProjects:(() -> Void)?
    var onSaveUser:((Data) -> Void)?
    var onSaveProject:((Data, String) -> Void)?
    var onClearProjects:(() -> Void)?
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
    
    func save(user:Data) throws {
        self.onSaveUser?(user)
    }
    
    func save(project:Data, with identifier:String) throws {
        self.onSaveProject?(project, identifier)
    }
    
    func clearProjects() throws {
        self.onClearProjects?()
    }
}
