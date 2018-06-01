import XCTest
import Board
@testable import Repository

class TestSerialise:XCTestCase {
    private var model:Serialise!
    private var board:BoardProtocol!
    private var project:ProjectProtocol!
    private var column:ColumnProtocol!
    private var card:CardProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Serialise()
        self.board = BoardFactory.newBoard()
        self.project = ProjectFactory.newProject()
        self.column = ColumnFactory.newColumn()
        self.card = CardFactory.newCard()
        self.project.name = "hello world"
        self.column.name = "lorem ipsum"
        self.card.content = "abcd"
        self.column.add(card:self.card)
        self.project.add(column:self.column)
    }
    
    func testMakeBoard() {
        var data:Data!
        XCTAssertNoThrow(data = try self.model.makeDataFrom(board:self.board),
                         "Failed getting data")
        XCTAssertNotNil(data, "Failed to load data")
        XCTAssertFalse(data.isEmpty, "Empty data")
        self.validateBoard(data:data)
    }
    
    func testMakeProject() {
        var data:Data!
        XCTAssertNoThrow(data = try self.model.makeDataFrom(project:self.project),
                         "Failed getting data")
        XCTAssertNotNil(data, "Failed to load data")
        XCTAssertFalse(data.isEmpty, "Empty data")
        self.validateProject(data:data)
    }
    
    private func validateBoard(data:Data) {
        var json:Any!
        do { json = try JSONSerialization.jsonObject(with:data, options:JSONSerialization.ReadingOptions()) } catch { }
        XCTAssertNotNil(json, "Invalid json")
        let dictionary:[String:Any]? = json as? [String:Any]
        let identifier:String? = dictionary?[RepositoryConstants.Keys.Shared.identifier] as? String
        XCTAssertNotNil(identifier, "Invalid identifier")
        XCTAssertEqual(identifier, self.board.identifier, "Invalid identifier")
    }
    
    private func validateProject(data:Data) {
        var json:Any!
        do { json = try JSONSerialization.jsonObject(with:data, options:JSONSerialization.ReadingOptions()) } catch { }
        XCTAssertNotNil(json, "Invalid json")
        let dictionary:[String:Any]? = json as? [String:Any]
        let identifier:String? = dictionary?[RepositoryConstants.Keys.Shared.identifier] as? String
        let created:Int? = dictionary?[RepositoryConstants.Keys.Shared.created] as? Int
        let name:String? = dictionary?[RepositoryConstants.Keys.Project.name] as? String
        XCTAssertNotNil(identifier, "Invalid identifier")
        XCTAssertNotNil(created, "Invalid created")
        XCTAssertNotNil(name, "Invalid name")
        XCTAssertEqual(identifier, self.project.identifier, "Invalid identifier")
        XCTAssertEqual(created, self.project.created, "Invalid created")
        XCTAssertEqual(name, self.project.name, "Invalid name")
        self.validateColumnsWith(dictionary:dictionary!)
    }
    
    private func validateColumnsWith(dictionary:[String:Any]) {
        let columns:[[String:Any]]? = dictionary[RepositoryConstants.Keys.Project.columns] as? [[String:Any]]
        XCTAssertNotNil(columns, "No columns")
        XCTAssertEqual(columns!.count, 1, "Invalid number of columns")
        for column:[String:Any] in columns! {
            let identifier:String? = column[RepositoryConstants.Keys.Shared.identifier] as? String
            let created:Int? = column[RepositoryConstants.Keys.Shared.created] as? Int
            let name:String? = column[RepositoryConstants.Keys.Column.name] as? String
            XCTAssertNotNil(identifier, "Invalid identifier")
            XCTAssertNotNil(created, "Invalid created")
            XCTAssertNotNil(name, "Invalid name")
            XCTAssertEqual(identifier, self.column.identifier, "Invalid identifier")
            XCTAssertEqual(created, self.column.created, "Invalid created")
            XCTAssertEqual(name, self.column.name, "Invalid name")
            self.validateCardsWith(dictionary:column)
        }
    }
    
    private func validateCardsWith(dictionary:[String:Any]) {
        let cards:[[String:Any]]? = dictionary[RepositoryConstants.Keys.Column.cards] as? [[String:Any]]
        XCTAssertNotNil(cards, "No cards")
        XCTAssertEqual(cards!.count, 1, "Invalid number of cards")
        for card:[String:Any] in cards! {
            let identifier:String? = card[RepositoryConstants.Keys.Shared.identifier] as? String
            let created:Int? = card[RepositoryConstants.Keys.Shared.created] as? Int
            let content:String? = card[RepositoryConstants.Keys.Card.content] as? String
            XCTAssertNotNil(identifier, "Invalid identifier")
            XCTAssertNotNil(created, "Invalid created")
            XCTAssertNotNil(content, "Invalid content")
            XCTAssertEqual(identifier, self.card.identifier, "Invalid identifier")
            XCTAssertEqual(created, self.card.created, "Invalid created")
            XCTAssertEqual(content, self.card.content, "Invalid content")
        }
    }
}
