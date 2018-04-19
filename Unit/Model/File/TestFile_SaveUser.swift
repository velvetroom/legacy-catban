import XCTest
@testable import catban

class TestFile_SaveUser:XCTestCase {
    private var model:File!
    private var user:Data!
    private struct Constants {
        static let rootFolder:String = "tests"
        static let userData:Any = ["user":"lorem ipsum"]
    }
    
    override func setUp() {
        super.setUp()
        File.rootFolder = Constants.rootFolder
        self.model = File()
        do {
            try self.user = JSONSerialization.data(withJSONObject:Constants.userData,
                                                   options:JSONSerialization.WritingOptions())
        } catch { }
    }
    
    override func tearDown() {
        super.tearDown()
        do { try FileManager.default.removeItem(at:self.model.directory) } catch { }
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.user, "Failed to load user")
    }
    
    func testNoThrows() {
        XCTAssertNoThrow(try self.model.save(user:self.user), "Failed to save user")
    }
    
    func testCreateFile() {
        XCTAssertFalse(self.fileExists(), "User should not exist before")
        
        do { try self.model.save(user:self.user) } catch { }
        
        XCTAssertTrue(self.fileExists(), "User should exist after")
    }
    
    func testFileSize() {
        do { try self.model.save(user:self.user) } catch { }
        var data:Data! = nil
        do { try data = Data.init(contentsOf:self.model.user) } catch { }
        XCTAssertEqual(data.count, self.user.count, "Invalid number of bytes written")
    }
    
    private func fileExists() -> Bool {
        return FileManager.default.fileExists(atPath:self.model.user.path)
    }
}
