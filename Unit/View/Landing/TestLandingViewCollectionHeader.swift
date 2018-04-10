import XCTest
@testable import catban

class TestLandingViewCollectionHeader:XCTestCase {
    private var header:LandingViewCollectionHeader!
    private var delegate:MockLandingPresenterCollectionDataSourceProtocol!
    private var column:ProjectColumn!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.header = LandingViewCollectionHeader(frame:CGRect.zero)
        self.delegate = MockLandingPresenterCollectionDataSourceProtocol()
        self.column = ProjectColumn()
        self.header.delegate = self.delegate
        self.header.column = self.column
    }
    
    func testLoad() {
        XCTAssertNotNil(self.header, "Failed to load header")
        XCTAssertNotNil(self.header.labelTitle, "Failed to load header title")
        XCTAssertNotNil(self.header.button, "Failed to load button")
        XCTAssertNotNil(self.header.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.header.column, "Failed to load column")
    }
    
    func testSelectorEdit() {
        self.startExpectation()
        self.delegate.onEditColumn = { [weak self] (column:ProjectColumn) in
            XCTAssertTrue(column === self?.column, "Invalid column received")
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
