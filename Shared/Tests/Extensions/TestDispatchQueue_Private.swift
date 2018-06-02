import XCTest
@testable import Shared

class TestDispatchQueue_Private:XCTestCase {
    private struct Constants {
        static let identifier:String = "hello world"
    }
    
    func testFactory() {
        let queue:DispatchQueue? = DispatchQueue.privateBackgroundWith(identifier:Constants.identifier)
        XCTAssertNotNil(queue, "Failed to load queue")
    }
    
    func testFactoryLabel() {
        let queue:DispatchQueue = DispatchQueue.privateBackgroundWith(identifier:Constants.identifier)
        XCTAssertEqual(queue.label, Constants.identifier, "Invalid identifier")
    }
    
    func testFactoryQos() {
        let queue:DispatchQueue = DispatchQueue.privateBackgroundWith(identifier:Constants.identifier)
        XCTAssertEqual(queue.qos, DispatchQoS.background, "Invalid quality of service")
    }
}
