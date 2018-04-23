import XCTest
@testable import catban

class TestBoard_Select:XCTestCase {
    private var model:Board!
    private struct Constants {
        static let minIndex:Int = 0
        static let maxIndex:Int = 2
    }
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.addProjects()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testUpdateCurrentProject() {
        self.model.selectProjectAt(index:Constants.minIndex)
        self.compareCurrentWith(index:Constants.minIndex)
        
        self.model.selectProjectAt(index:Constants.maxIndex)
        self.compareCurrentWith(index:Constants.maxIndex)
    }
    
    private func addProjects() {
        for _:Int in 0 ... Constants.maxIndex {
            self.model.insertProject(project:Project())
        }
    }
    
    private func compareCurrentWith(index:Int) {
        let current:Project = self.model.project as! Project
        let project:Project = self.model.projects[index] as! Project
        XCTAssertTrue(current === project, "Failed to assign current project to index")
    }
}
