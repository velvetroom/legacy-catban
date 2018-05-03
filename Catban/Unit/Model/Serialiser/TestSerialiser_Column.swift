import XCTest
@testable import catban

class TestSerialiser_Column:XCTestCase {
    private var model:Serialiser!
    private var project:Project!
    private struct Constants {
        static let name:String = "hello world"
        static let identifier:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Serialiser()
        self.project = Project()
        let column:ProjectColumn = ProjectColumn()
        column.identifier = Constants.identifier
        column.name = Constants.name
        column.cards.append(ProjectCard())
        column.cards.append(ProjectCard())
        self.project.columns.append(column)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testSameAmountOfColumns() {
        let array:[Any] = self.model.columnArrayWith(project:self.project)
        XCTAssertEqual(array.count, self.project.columns.count, "Failed to serialise columns")
    }
    
    func testAsDictionary() {
        let array:[Any] = self.model.columnArrayWith(project:self.project)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        XCTAssertNotNil(dictionary, "Invalid object received")
    }
    
    func testIdentifier() {
        let array:[Any] = self.model.columnArrayWith(project:self.project)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        let identifier:String! = dictionary[Serialiser.Constants.Column.identifier] as? String
        XCTAssertEqual(identifier, Constants.identifier, "Invalid identifier serialised")
    }
    
    func testName() {
        let array:[Any] = self.model.columnArrayWith(project:self.project)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        let name:String! = dictionary[Serialiser.Constants.Column.name] as? String
        XCTAssertEqual(name, Constants.name, "Invalid name serialised")
    }
    
    func testDictionaryWithCards() {
        let array:[Any] = self.model.columnArrayWith(project:self.project)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        let cards:[Any]! = dictionary[Serialiser.Constants.Column.cards] as? [Any]
        XCTAssertNotNil(cards, "Failed to serialise cards")
    }
    
    func testAmountOfCards() {
        let array:[Any] = self.model.columnArrayWith(project:self.project)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        let cards:[Any]! = dictionary[Serialiser.Constants.Column.cards] as? [Any]
        XCTAssertEqual(cards.count, self.project.columns.first!.cards.count, "Invalid number of cards serialised")
    }
}
