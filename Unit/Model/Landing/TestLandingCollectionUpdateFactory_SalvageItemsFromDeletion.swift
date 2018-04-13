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
        self.addColumnWith(cards:0)
        
        var updates:[CollectionUpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.salvageItemsFromColumn(index:0, in:self.project))
        
        XCTAssertTrue(updates.isEmpty, "Updates should be empty when no card is on column")
    }
    
    func testUpdatesForMovingItemsFromColumnWithEmptyColumnAndTwoColumns() {
        self.addColumnWith(cards:0)
        self.addColumnWith(cards:0)
        
        var updates:[CollectionUpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.salvageItemsFromColumn(index:1, in:self.project))
        
        XCTAssertTrue(updates.isEmpty, "Updates should be empty when no card is on column")
    }
    
    func testUpdatesForMovingItemsFromFirstColumn() {
        let cards:Int = 10
        let column:Int = 0
        self.addColumnWith(cards:cards)
        self.addColumnWith(cards:3)
        let previous:Int = self.project.columns[1].cards.count
        
        var updates:[CollectionUpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.salvageItemsFromColumn(index:column, in:self.project))
        
        XCTAssertEqual(updates.count, cards, "Updates should be equal to cards")
        self.validate(updates:updates, with:column, previous:previous)
    }
    
    func testUpdatesForMovingItemsFromNotFirstColumn() {
        let column:Int = 1
        let cards:Int = 5
        self.addColumnWith(cards:0)
        self.addColumnWith(cards:cards)
        let previous:Int = self.project.columns[0].cards.count
        
        var updates:[CollectionUpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.salvageItemsFromColumn(index:column, in:self.project))
        
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
        self.validateOriginItem(updates:updates)
        self.validateOriginColumn(updates:updates, with:column)
        self.validateDestinationBeforeUpdateItem(updates:updates, previous:size)
        self.validateDestinationAfterUpdateItem(updates:updates, previous:size)
        self.validateDestinationBeforeUpdateColumn(updates:updates, with:column)
        self.validateDestinationAfterUpdateColumn(updates:updates, with:column)
        self.validateOriginItemIsLessThanPreviousItem(updates:updates)
    }
    
    private func validateOriginItem(updates:[CollectionUpdateProtocol]) {
        let count:Int = updates.count
        for index:Int in 0 ..< count {
            let update:CollectionUpdateSalvageItemFromDeletion = updates[index]
                as! CollectionUpdateSalvageItemFromDeletion
            XCTAssertEqual(update.origin.item, count - (index + 1), "Invalid origin item")
        }
    }
    
    private func validateOriginColumn(updates:[CollectionUpdateProtocol], with column:Int) {
        let count:Int = updates.count
        for index:Int in 0 ..< count {
            let update:CollectionUpdateSalvageItemFromDeletion = updates[index]
                as! CollectionUpdateSalvageItemFromDeletion
            XCTAssertEqual(update.origin.section, column, "Invalid origin column")
        }
    }
    
    private func validateDestinationBeforeUpdateItem(updates:[CollectionUpdateProtocol], previous size:Int) {
        let count:Int = updates.count
        for index:Int in 0 ..< count {
            let update:CollectionUpdateSalvageItemFromDeletion = updates[index]
                as! CollectionUpdateSalvageItemFromDeletion
            XCTAssertEqual(update.destinationBeforeUpdate.item, index + size, "Invalid destination item")
        }
    }
    
    private func validateDestinationAfterUpdateItem(updates:[CollectionUpdateProtocol], previous size:Int) {
        let count:Int = updates.count
        for index:Int in 0 ..< count {
            let update:CollectionUpdateSalvageItemFromDeletion = updates[index]
                as! CollectionUpdateSalvageItemFromDeletion
            XCTAssertEqual(update.destinationAfterUpdate.item, index + size, "Invalid destination item")
        }
    }
    
    private func validateDestinationBeforeUpdateColumn(updates:[CollectionUpdateProtocol], with column:Int) {
        let count:Int = updates.count
        for index:Int in 0 ..< count {
            let expectedColumn:Int
            if column == 0 {
                expectedColumn = column + 1
            } else {
                expectedColumn = column - 1
            }
            let update:CollectionUpdateSalvageItemFromDeletion = updates[index]
                as! CollectionUpdateSalvageItemFromDeletion
            XCTAssertEqual(update.destinationBeforeUpdate.section, expectedColumn, "Invalid destination column")
        }
    }
    
    private func validateDestinationAfterUpdateColumn(updates:[CollectionUpdateProtocol], with column:Int) {
        let count:Int = updates.count
        for index:Int in 0 ..< count {
            let expectedColumn:Int
            if column == 0 {
                expectedColumn = 0
            } else {
                expectedColumn = column - 1
            }
            let update:CollectionUpdateSalvageItemFromDeletion = updates[index]
                as! CollectionUpdateSalvageItemFromDeletion
            XCTAssertEqual(update.destinationAfterUpdate.section, expectedColumn, "Invalid destination column")
        }
    }
    
    private func validateOriginItemIsLessThanPreviousItem(updates:[CollectionUpdateProtocol]) {
        let count:Int = updates.count
        var previousOriginItem:Int?
        for index:Int in 0 ..< count {
            let update:CollectionUpdateSalvageItemFromDeletion = updates[index]
                as! CollectionUpdateSalvageItemFromDeletion
            if let previousItem:Int = previousOriginItem {
                XCTAssertLessThan(update.origin.item, previousItem,
                                  "Moving item should be lower than previous moving item")
            }
            previousOriginItem = update.origin.item
        }
    }
}
