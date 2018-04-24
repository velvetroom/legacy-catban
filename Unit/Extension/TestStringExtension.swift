import XCTest
@testable import catban

class TestStringExtension:XCTestCase {
    private struct Constants {
        static let expectedLoad:String = "catban"
        static let expectedLanding:String = "catban"
        static let expectedProject:String = "My first project"
        static let expectedWriter:String = "Done"
        static let expectedOrganise:String = "Projects"
        static let expectedStats:String = "Stats"
        static let expectedError:String = "Projects need to have at least one Column"
    }
    
    func testLocalizableStringsFromLoad() {
        let string:String = String.localizedLoad(key:"LoadController_title")
        XCTAssertEqual(string, Constants.expectedLoad, "Unable to find localized string")
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
    
    func testLocalizableStringsFromOrganise() {
        let string:String = String.localizedOrganise(key:"OrganiseController_title")
        XCTAssertEqual(string, Constants.expectedOrganise, "Unable to find localized string")
    }
    
    func testLocalizableStringsFromStats() {
        let string:String = String.localizedStats(key:"StatsController_title")
        XCTAssertEqual(string, Constants.expectedStats, "Unable to find localized string")
    }
    
    func testLocalizableStringsFromError() {
        let string:String = String.localizedError(key:"ErrorProject_oneColumnMinimum")
        XCTAssertEqual(string, Constants.expectedError, "Unable to find localized string")
    }
}
