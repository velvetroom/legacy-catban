import XCTest
@testable import Home

class TestViewModelBuilderTextContent:XCTestCase {
    private var builder:ViewModelBuilderColumnsTextContent!
    private struct Constants {
        static let text:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.builder = ViewModelBuilderColumnsTextContent()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.builder, "Failed to load builder")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.builder.width, "Failed to load property")
    }
    
    func testHeight() {
        let height:CGFloat = self.builder.heightFor(content:Constants.text)
        XCTAssertGreaterThan(height, 0, "Failed to load height")
    }
}