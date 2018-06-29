import XCTest
@testable import Board

class TestSynchedProtocol:XCTestCase {
    private var model:MockSynchedProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = MockSynchedProtocol()
    }
    
    func testNotNeedingSync() {
        XCTAssertFalse(self.model.needsSync, "Should not need")
        
        self.model.changeTimestamp = 1
        self.model.uploadTimestamp = 1
        self.model.downloadTimestamp = 10
        XCTAssertFalse(self.model.needsSync, "Should not need")
        
        self.model.uploadTimestamp = 10
        self.model.downloadTimestamp = 10
        XCTAssertFalse(self.model.needsSync, "Should not need")
    }
    
    func testNeedsSynching() {
        self.model.changeTimestamp = 1
        XCTAssertTrue(self.model.needsSync, "Should need sync")
        
        self.model.changeTimestamp = 10
        self.model.uploadTimestamp = 9
        self.model.downloadTimestamp = 10
        XCTAssertTrue(self.model.needsSync, "Should need sync")
    }
}
