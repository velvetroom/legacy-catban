import XCTest
@testable import catban

class TestStringExtension:XCTestCase {
    private struct Constants {
        static let expectedLanding:String = "catban"
        static let expectedProject:String = "My first project"
        static let expectedWriter:String = "Done"
        static let expectedError:String = "Project needs to have at least one Column"
    }
    
    func testLocalizableStringsFromLanding() {
        let string:String = String.localizedLanding(key:"LandingController_title")
        XCTAssertEqual(string, Constants.expectedLanding, "Unable to find localized string")
    }
    
    func testLocalizableStringsFromProject() {
        let string:String = String.localizedProject(key:"Project_defaultName")
        XCTAssertEqual(string, Constants.expectedProject, "Unable to find localized string")
    }
    
    func testLocalizableStringsFromWriter() {
        let string:String = String.localizedWriter(key:"WriterViewBar_buttonDone")
        XCTAssertEqual(string, Constants.expectedWriter, "Unable to find localized string")
    }
    
    func testLocalizableStringsFromError() {
        let string:String = String.localizedError(key:"ErrorProject_oneColumnMinimum")
        XCTAssertEqual(string, Constants.expectedError, "Unable to find localized string")
    }
}
