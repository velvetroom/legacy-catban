import XCTest
@testable import catban

class TestProjectColumn:XCTestCase {
    private var column:ProjectColumn!
    private struct Constants {
        static let title:String = "test"
        static let insertingIndex:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.column = Project.factoryDefaultColumns().first
    }
    
    func testLoad() {
        XCTAssertNotNil(self.column, "Failed to load column")
        XCTAssertNotNil(self.column.name, "Failed to load name")
        XCTAssertNotNil(self.column.cards, "Failed to load cards")
        XCTAssertFalse(self.column.cards.isEmpty, "No cards found in column")
    }
    
    func testRemove() {
        let countCards:Int = self.column.cards.count
        for index:Int in 0 ..< countCards {
            let removing:Int = countCards - (1 + index)
            let _:ProjectCard = self.column.remove(card:removing)
        }
        
        XCTAssertTrue(self.column.cards.isEmpty, "Failed to remove columns")
    }
    
    func testInsert() {
        let card:ProjectCard = ProjectCard()
        card.title = Constants.title
        let initialTitle:String = self.titleAt(index:Constants.insertingIndex)
        XCTAssertNotEqual(Constants.title, initialTitle, "Initial title should not be the same as expected")
        let initialSize:Int = self.column.cards.count
        
        self.column.insert(card:card, at:Constants.insertingIndex)
        
        let updatedTitle:String = self.titleAt(index:Constants.insertingIndex)
        XCTAssertEqual(Constants.title, updatedTitle, "Failed to insert card at specified position")
        XCTAssertGreaterThan(self.column.cards.count, initialSize, "Cards size not increasing")
    }
    
    private func titleAt(index:Int) -> String {
        return self.column.cards[index].title
    }
}
