import XCTest
@testable import catban

class TestOrganisePresenterFactory:XCTestCase {
    private var factory:OrganisePresenterFactory!
    private var board:Board!
    private var project:Project!
    private struct Constants {
        static let name:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.factory = OrganisePresenterFactory()
        self.board = Board()
        self.project = Project()
        self.project.name = Constants.name
        self.board.projects.append(self.project)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testFactory() {
        let viewModel:OrganiseViewModel = self.factory.factoryWith(board:self.board)
        XCTAssertNotNil(viewModel, "Failed to factory view model")
    }
    
    func testNumberOfItems() {
        let viewModel:OrganiseViewModel = self.factory.factoryWith(board:self.board)
        XCTAssertEqual(viewModel.collection.items.count, self.board.projects.count,
                       "Invalid number of items factored")
    }
    
    func testItemsName() {
        let viewModel:OrganiseViewModel = self.factory.factoryWith(board:self.board)
        let count:Int = viewModel.collection.items.count
        for index:Int in 0 ..< count {
            let item:OrganiseViewModelCollectionItem = viewModel.collection.items[index]
            XCTAssertEqual(item.name, self.board.projects[index].name, "Invalid name for item")
        }
    }
}
