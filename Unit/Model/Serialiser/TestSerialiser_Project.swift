import XCTest
@testable import catban

class TestSerialiser_Project:XCTestCase {
    private var model:Serialiser!
    private var project:Project!
    private struct Constants {
        static let identifier:String = "hello world"
        static let name:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Serialiser()
        self.project = Project()
        self.project.identifier = Constants.identifier
        self.project.name = Constants.name
        self.project.columns.append(ProjectColumn())
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.model.serialise(project:self.project), "Failed to serialise project")
    }
    
    func testDataNotEmpty() {
        var data:Data!
        do { data = try self.model.serialise(project:self.project) } catch {  }
        XCTAssertNotNil(data, "Failed to serialise project")
        XCTAssertFalse(data.isEmpty, "Empty data returned")
    }
    
    func testDictionaryWithIdentifier() {
        let dictionary:[String:Any] = self.model.dictionaryWith(project:self.project)
        let identifier:String! = dictionary[Serialiser.Constants.Project.identifier] as? String
        XCTAssertEqual(identifier, Constants.identifier, "Invalid identifier serialised")
    }
    
    func testDictionaryWithName() {
        let dictionary:[String:Any] = self.model.dictionaryWith(project:self.project)
        let name:String! = dictionary[Serialiser.Constants.Project.name] as? String
        XCTAssertEqual(name, Constants.name, "Invalid name serialised")
    }
    
    func testDictionaryWithColumns() {
        let dictionary:[String:Any] = self.model.dictionaryWith(project:self.project)
        let columns:[Any]! = dictionary[Serialiser.Constants.Project.columns] as? [Any]
        XCTAssertNotNil(columns, "Failed to serialise columns")
    }
    
    func testAmountOfColumns() {
        let dictionary:[String:Any] = self.model.dictionaryWith(project:self.project)
        let columns:[Any]! = dictionary[Serialiser.Constants.Project.columns] as? [Any]
        XCTAssertEqual(columns.count, self.project.columns.count, "Invalid number of columns serialised")
    }
}
