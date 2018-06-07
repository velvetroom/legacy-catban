import XCTest
@testable import Projects

class TestViewModelListItemFactory:XCTestCase {
    private struct Constants {
        static let identifier:String = "hello world"
        static let name:String = "lorem ipsum"
    }
    
    func testMakeNewItem() {
        let project:MockProjectManagedProtocol = MockProjectManagedProtocol()
        project.identifier = Constants.identifier
        project.name = Constants.name
        
        let item:ViewModelListItem = ViewModelListItemFactory.makeWith(project:project)
        XCTAssertEqual(item.identifier, Constants.identifier, "Not injected")
        XCTAssertEqual(item.name, Constants.name, "Not injected")
    }
}
