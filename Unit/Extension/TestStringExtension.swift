import XCTest
@testable import catban

class TestStringExtension:XCTestCase {
    private struct Constants {
        static let expectedLanding:String = "catban"
    }
    
    func testLocalizableStringsFromLanding() {
        let string:String = String.localizedLanding(key:"LandingController_title")
        XCTAssertEqual(string, Constants.expectedLanding, "Unable to find localized string")
    }
}
