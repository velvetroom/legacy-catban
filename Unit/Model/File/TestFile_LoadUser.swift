import XCTest
@testable import catban

class TestFile_LoadUser:XCTestCase {
    private var model:File!
    
    override func setUp() {
        super.setUp()
        self.model = File()
    }
    
    override func tearDown() {
        super.tearDown()
        do {
            try FileManager.default.removeItem(at:self.model.user)
        } catch { }
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testLoadUserSuccess() {
        self.createFile()
        XCTAssertNoThrow(try self.model.loadUser(), "Failed to load user")
    }
    
    func testLoadUserError() {
        XCTAssertThrowsError(try self.model.loadUser(), "Failed to throw when user not found")
    }
    
    private func createFile() {
        do {
            try Data().write(to:self.model.user)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
