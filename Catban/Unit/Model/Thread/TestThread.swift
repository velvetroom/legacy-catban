import XCTest
@testable import catban

class TestThread:XCTestCase {
    private struct Constants {
        static let label:String = "lorem ipsum"
    }
    
    func testFactoryBackground() {
        let dispatch:DispatchQueue = Thread.factoryBackgroundConcurrentWith(label:Constants.label)
        XCTAssertEqual(dispatch.label, Constants.label, "Label not assigned to dispatch")
        XCTAssertEqual(dispatch.qos, DispatchQoS.background, "Invalid quality of service")
    }
}
