import XCTest
@testable import catban

class TestLandingViewCollectionHeader:XCTestCase {
    private var header:LandingViewCollectionHeader!
    private var delegate:MockLandingPresenterCollectionDataSourceProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let section:Int = 99893
    }
    
    override func setUp() {
        super.setUp()
        self.header = LandingViewCollectionHeader(frame:CGRect.zero)
        self.delegate = MockLandingPresenterCollectionDataSourceProtocol()
        self.header.delegate = self.delegate
        self.header.section = Constants.section
    }
    
    func testLoad() {
        XCTAssertNotNil(self.header, "Failed to load header")
        XCTAssertNotNil(self.header.labelTitle, "Failed to load header title")
        XCTAssertNotNil(self.header.button, "Failed to load button")
        XCTAssertNotNil(self.header.section, "Failed to load section")
        XCTAssertNotNil(self.header.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testSelectorEdit() {
        self.startExpectation()
        self.delegate.onEditHeader = { [weak self] (section:Int) in
            XCTAssertEqual(section, Constants.section, "Invalid section received")
            self?.expect?.fulfill()
        }
        
        self.header.selectorEdit(sender:UIButton())
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
