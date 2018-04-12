import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_SalvageItemsFromDeletion:XCTestCase {
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
        
        let updates:[CollectionUpdateProtocol] = self.factory.salvageItemsFromColumn(index:0, in:self.project)
        
        XCTAssertTrue(updates.isEmpty, "Updates should be empty when no card is on column")
    }
    
    func testUpdatesForMovingItemsFromColumnWithEmptyColumnAndTwoColumns() {
        self.addColumnWith(cards:0)
        self.addColumnWith(cards:0)
        
        let updates:[CollectionUpdateProtocol] = self.factory.salvageItemsFromColumn(index:1, in:self.project)
        
        XCTAssertTrue(updates.isEmpty, "Updates should be empty when no card is on column")
    }
    
    func testUpdatesForMovingItemsFromFirstColumn() {
        let cards:Int = 10
        let column:Int = 0
        self.addColumnWith(cards:cards)
        self.addColumnWith(cards:3)
        let previous:Int = self.project.columns[1].cards.count
        
        let updates:[CollectionUpdateProtocol] = self.factory.salvageItemsFromColumn(index:column, in:self.project)
        
        XCTAssertEqual(updates.count, cards, "Updates should be equal to cards")
        self.validate(updates:updates, with:column, previous:previous)
    }
    
    func testUpdatesForMovingItemsFromNotFirstColumn() {
        let column:Int = 1
        let cards:Int = 5
        self.addColumnWith(cards:0)
        self.addColumnWith(cards:cards)
        let previous:Int = self.project.columns[0].cards.count
        
        let updates:[CollectionUpdateProtocol] = self.factory.salvageItemsFromColumn(index:column, in:self.project)
        
        XCTAssertEqual(updates.count, cards, "Updates should be equal to cards")
        self.validate(updates:updates, with:column, previous:previous)
    }
    
    private func addColumnWith(cards:Int) {
        let column:ProjectColumn = ProjectColumn()
        for _:Int in 0 ..< cards {
            column.cards.append(ProjectCard())
        }
        self.project.columns.append(column)
    }
    
    private func validate(updates:[CollectionUpdateProtocol], with column:Int, previous size:Int) {
        let count:Int = updates.count
        var previousOriginItem:Int?
        for index:Int in 0 ..< count {
            guard
                let update:CollectionUpdateSalvageItemFromDeletion = updates[index] as? CollectionUpdateSalvageItemFromDeletion
            else {
                XCTAssertTrue(false, "Update is not moving item type")
                return
            }
            XCTAssertEqual(update.origin.item, count - (index + 1), "Invalid origin item")
            XCTAssertEqual(update.origin.section, column, "Invalid origin column")
            XCTAssertEqual(update.destination.item, index + size, "Invalid destination item")
            XCTAssertNotEqual(update.destination.section, column, "Invalid destination column")
            
            if let previousItem:Int = previousOriginItem {
                XCTAssertLessThan(update.origin.item, previousItem,
                                   "Moving item should be lower than previous moving item")
            }
            previousOriginItem = update.origin.item
        }
    }
}
