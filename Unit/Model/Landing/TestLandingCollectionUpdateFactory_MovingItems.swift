import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_MovingItems:XCTestCase {
    private var factory:LandingCollectionUpdateFactory!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.factory = LandingCollectionUpdateFactory()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testUpdatesForMovingItemsFromColumnWithEmptyColumnAndOnlyOneColumn() {
        self.addColumnWith(cards:0)
        
        let updates:[CollectionUpdateProtocol] = self.factory.updatesForMovingItemsFromColumn(
            index:0, in:self.project)
        
        XCTAssertTrue(updates.isEmpty, "Updates should be empty when no card is on column")
    }
    
    func testUpdatesForMovingItemsFromColumnWithEmptyColumnAndTwoColumns() {
        self.addColumnWith(cards:0)
        self.addColumnWith(cards:0)
        
        let updates:[CollectionUpdateProtocol] = self.factory.updatesForMovingItemsFromColumn(
            index:1, in:self.project)
        
        XCTAssertTrue(updates.isEmpty, "Updates should be empty when no card is on column")
    }
    
    func testUpdatesForMovingItemsFromFirstColumn() {
        let cards:Int = 10
        let column:Int = 0
        self.addColumnWith(cards:cards)
        self.addColumnWith(cards:0)
        
        let updates:[CollectionUpdateProtocol] = self.factory.updatesForMovingItemsFromColumn(
            index:column, in:self.project)
        
        XCTAssertEqual(updates.count, cards, "Updates should be equal to the amount of cards")
        self.validate(updates:updates, with:column)
    }
    
    func testUpdatesForMovingItemsFromNotFirstColumn() {
        let column:Int = 1
        let cards:Int = 5
        self.addColumnWith(cards:0)
        self.addColumnWith(cards:cards)
        
        let updates:[CollectionUpdateProtocol] = self.factory.updatesForMovingItemsFromColumn(
            index:column, in:self.project)
        
        XCTAssertEqual(updates.count, cards, "Updates should be equal to the amount of cards")
        self.validate(updates:updates, with:column)
    }
    
    private func addColumnWith(cards:Int) {
        let column:ProjectColumn = ProjectColumn()
        for _:Int in 0 ..< cards {
            column.cards.append(ProjectCard())
        }
        self.project.columns.append(column)
    }
    
    private func validate(updates:[CollectionUpdateProtocol], with column:Int) {
        for update:CollectionUpdateProtocol in updates {
            
        }
    }
}
