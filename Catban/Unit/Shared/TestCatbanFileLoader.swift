import XCTest

class TestCatbanFileLoader:XCTestCase {
    private struct Constants {
        static let fileName:String = "CatbanUserSuccess"
    }
    
    func testBundle() {
        XCTAssertNotEqual(CatbanFileLoader.bundle, Bundle.main, "File loader should not user main bundle")
    }
    
    func testLoadFile() {
        let file:Data? = CatbanFileLoader.loadWith(name:Constants.fileName)
        XCTAssertNotNil(file, "Failed to load file")
    }
}
