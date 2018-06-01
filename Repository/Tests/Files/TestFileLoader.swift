import XCTest

class TestFileLoader:XCTestCase {
    private struct Constants {
        static let fileName:String = "Board"
    }
    
    func testLoadFile() {
        let file:Data? = FileLoader.load(fileNamed:Constants.fileName)
        XCTAssertNotNil(file, "Failed to load file")
    }
}
