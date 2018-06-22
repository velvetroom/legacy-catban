import XCTest
@testable import Home

class TestViewMenuClose:XCTestCase {
    
    func testImageFactory() {
        XCTAssertNotNil(ViewMenuCloseFactory.makeOpenAnimation(), "Factory failed")
        XCTAssertNotNil(ViewMenuCloseFactory.makeCloseAnimation(), "Factory failed")
    }
}
