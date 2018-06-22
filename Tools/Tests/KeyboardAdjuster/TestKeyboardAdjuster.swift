import XCTest
@testable import Tools

class TestKeyboardAdjuster:XCTestCase {
    private var adjuster:KeyboardAdjuster!
    private var notificationCenter:MockNotificationCenter!
    private var view:UIView!
    private var superview:UIView!
    private var notification:Notification!
    private struct Constants {
        static let duration:TimeInterval = 0
        static let viewFrame:CGRect = CGRect(x:0, y:0, width:1000, height:1000)
        static let frame:CGRect = CGRect(x:100, y:200, width:300, height:400)
    }
    
    override func setUp() {
        super.setUp()
        self.adjuster = KeyboardAdjuster()
        self.notificationCenter = MockNotificationCenter()
        self.superview = UIView()
        self.view = UIView()
        self.superview.addSubview(self.view)
        self.superview.frame = Constants.viewFrame
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.notification = Notification(name:Notification.Name.UIKeyboardWillChangeFrame)
        self.adjuster.view = self.view
        self.adjuster.notificationCenter = self.notificationCenter
        self.view.frame = Constants.viewFrame
        self.notification.userInfo = [
            UIKeyboardFrameEndUserInfoKey : NSValue(cgRect:Constants.frame),
            UIKeyboardAnimationDurationUserInfoKey : NSNumber(value:Constants.duration)]
    }
    
    func testRemoveObserver() {
        var removed:Bool = false
        self.notificationCenter.onRemoveObserver = { removed = true }
        self.adjuster = nil
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testAdjustOutlets() {
        let expectedConstant:CGFloat = -Constants.frame.height
        NotificationCenter.default.post(self.notification)
        XCTAssertEqual(self.adjuster.layoutBottom?.constant, expectedConstant, "Failed to adjust")
    }
}
