import XCTest
@testable import catban

class TestProject_DeleteColumn:XCTestCase {
    private var project:Project!
    private struct Constants {
        static let column:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryFirstProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testDeleteRemovesColumn() {
        weak var column:ProjectColumn? = self.project.columns[Constants.column]
        let initialColumns:Int = self.project.columns.count
        let expectedColumns:Int = initialColumns - 1
        XCTAssertNotNil(column, "Initially column should exist")
        
        self.project.deleteColumnAt(index:Constants.column)
        let finalColumns:Int = self.project.columns.count
        
        XCTAssertEqual(finalColumns, expectedColumns, "Invalid number of columns after delete")
        XCTAssertNil(column, "Column should be released")
    }
}
