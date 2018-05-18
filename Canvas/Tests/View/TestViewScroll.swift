import XCTest
@testable import Home

class TestViewScroll:XCTestCase {
    private var view:ViewScroll!
    private var subView:UIView!
    private struct Constants {
        static let width:CGFloat = 120
        static let height:CGFloat = 130
        static let updatedWidth:CGFloat = 344
        static let updatedHeight:CGFloat = 223
    }
    
    override func setUp() {
        super.setUp()
        self.view = ViewScroll()
        self.subView = UIView()
        self.view.contentSize = CGSize(width:Constants.width, height:Constants.height)
        self.view.addSubview(self.subView)
    }
    
    func testInitialValues() {
        XCTAssertNotEqual(self.subView.frame.width, Constants.width, "Invalid")
        XCTAssertNotEqual(self.subView.frame.height, Constants.height, "Invalid")
    }
    
    func testUpdateContentSize() {
        self.view.updateContentSize()
        XCTAssertEqual(self.subView.frame.width, Constants.width, "Not updated")
        XCTAssertEqual(self.subView.frame.height, Constants.height, "Not updated")
    }
    
    func testUpdateContentSizeWithSize() {
        let size:CGSize = CGSize(width:Constants.updatedWidth, height:Constants.updatedHeight)
        self.view.updateContent(size:size)
        XCTAssertEqual(self.subView.frame.width, Constants.updatedWidth, "Not updated")
        XCTAssertEqual(self.subView.frame.height, Constants.updatedHeight, "Not updated")
        XCTAssertEqual(self.view.contentSize.width, Constants.updatedWidth, "Not updated")
        XCTAssertEqual(self.view.contentSize.height, Constants.updatedHeight, "Not updated")
    }
    
    func testUpdateContentOnFrameChange() {
        self.view.frame = CGRect(x:33, y:44, width:Constants.updatedWidth, height:Constants.updatedHeight)
        XCTAssertEqual(self.subView.frame.width, Constants.updatedWidth, "Not updated")
        XCTAssertEqual(self.subView.frame.height, Constants.updatedHeight, "Not updated")
        XCTAssertEqual(self.view.contentSize.width, Constants.updatedWidth, "Not updated")
        XCTAssertEqual(self.view.contentSize.height, Constants.updatedHeight, "Not updated")
    }
}
