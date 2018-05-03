import XCTest
@testable import catban

class TestSerialiser_User:XCTestCase {
    private var model:Serialiser!
    private var user:User!
    private struct Constants {
        static let identifier:String = "hello world"
        static let project:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Serialiser()
        self.user = User()
        self.user.identifier = Constants.identifier
        self.user.project.identifier = Constants.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.user, "Failed to load user")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.model.serialise(user:self.user), "Failed to serialise user")
    }
    
    func testDataNotEmpty() {
        var data:Data!
        do { data = try self.model.serialise(user:self.user) } catch {  }
        XCTAssertNotNil(data, "Failed to serialise user")
        XCTAssertFalse(data.isEmpty, "Empty data returned")
    }
    
    func testDictionaryWithIdentifier() {
        let dictionary:[String:Any] = self.model.dictionaryWith(user:self.user)
        let identifier:String! = dictionary[Serialiser.Constants.User.identifier] as? String
        XCTAssertEqual(identifier, Constants.identifier, "Invalid identifier serialised")
    }
    
    func testDictionaryWithProject() {
        let dictionary:[String:Any] = self.model.dictionaryWith(user:self.user)
        let projectIdentifier:String! = dictionary[Serialiser.Constants.User.projectIdentifier] as? String
        XCTAssertEqual(projectIdentifier, Constants.project, "Invalid project identifier serialised")
    }
}
