import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_DeleteProject:XCTestCase {
    private var factory:LandingCollectionUpdateFactory!
    private var board:Board!
    private var project:Project!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
        static let expectedUpdates:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.factory = LandingCollectionUpdateFactory()
        self.board = Board()
        self.project = Project()
        let otherProject:Project = Project()
        otherProject.columns.append(ProjectColumn())
        self.project.identifier = Constants.identifier
        self.project.columns.append(ProjectColumn())
        self.board.projects.append(otherProject)
        self.board.projects.append(self.project)
        self.board.project = project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.board, "Failed to load board")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.factory.deleteProject(board:self.board), "Failed to delete project")
    }
    
    func testThrows() {
        self.board.projects.removeFirst()
        XCTAssertThrowsError(try self.factory.deleteProject(board:self.board),
                             "Should throw error when only 1 project")
    }
    
    func testReturnsThreeUpdates() {
        var updates:[UpdateProtocol] = []
        do { try updates = self.factory.deleteProject(board:self.board) } catch { }
        XCTAssertEqual(updates.count, Constants.expectedUpdates, "Invalid number of updates returned")
    }
    
    func testReturnsUpdateDeleteProject() {
        var updates:[UpdateProtocol] = []
        do { try updates = self.factory.deleteProject(board:self.board) } catch { }
        let update:UpdateDeleteProject = updates[2] as! UpdateDeleteProject
        XCTAssertNotNil(update, "Invalid update received")
    }
    
    func testReturnsUpdateClose() {
        var updates:[UpdateProtocol] = []
        do { try updates = self.factory.deleteProject(board:self.board) } catch { }
        let update:UpdateCloseProject = updates[0] as! UpdateCloseProject
        XCTAssertNotNil(update, "Invalid update received")
    }
    
    func testReturnsUpdateOpen() {
        var updates:[UpdateProtocol] = []
        do { try updates = self.factory.deleteProject(board:self.board) } catch { }
        let update:UpdateOpenProject = updates[1] as! UpdateOpenProject
        XCTAssertNotNil(update, "Invalid update received")
        XCTAssertFalse(update.indexSet.isEmpty, "Failed to update indexset")
    }
}
