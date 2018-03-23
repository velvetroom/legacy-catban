import XCTest
@testable import catban

class TestStringExtension:XCTestCase {
    private struct Constants {
        static let expectedLanding:String = "catban"
        static let expectedProject:String = "My first project"
    }
    
    func testLocalizableStringsFromLanding() {
        let string:String = String.localizedLanding(key:"LandingController_title")
        XCTAssertEqual(string, Constants.expectedLanding, "Unable to find localized string")
    }
    
    func testLocalizableStringsFromProject() {
        let string:String = String.localizaedProject(key:"Project_defaultName")
        XCTAssertEqual(string, Constants.expectedProject, "Unable to find localized string")
    }
}
