import XCTest
@testable import catban

class TestFile_LoadUser:XCTestCase {
    private var model:File!
    private struct Constants {
        static let rootFolder:String = "tests"
    }
    
    override func setUp() {
        super.setUp()
        File.rootFolder = Constants.rootFolder
        self.model = File()
    }
    
    override func tearDown() {
        super.tearDown()
        do {
            try FileManager.default.removeItem(at:self.model.directory)
        } catch { }
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testLoadSuccess() {
        self.createFile()
        XCTAssertNoThrow(try self.model.loadUser(), "Failed to load user")
    }
    
    func testLoadError() {
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
