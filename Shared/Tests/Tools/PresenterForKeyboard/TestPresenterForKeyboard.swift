import XCTest
@testable import Shared

class TestPresenterForKeyboard:XCTestCase {
    private var presenter:PresenterForKeyboard!
    private var notificationCenter:MockNotificationCenter!
    private var viewContainer:UIView!
    private var layoutBottom:NSLayoutConstraint!
    private var notification:Notification!
    private struct Constants {
        static let duration:TimeInterval = 0
        static let viewFrame:CGRect = CGRect(x:0, y:0, width:1000, height:1000)
        static let frame:CGRect = CGRect(x:100, y:200, width:300, height:400)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterForKeyboard()
        self.notificationCenter = MockNotificationCenter()
        self.viewContainer = UIView()
        self.layoutBottom = NSLayoutConstraint()
        self.notification = Notification(name:Notification.Name.UIKeyboardWillChangeFrame)
        self.presenter.viewContainer = self.viewContainer
        self.presenter.layoutBottom = self.layoutBottom
        self.presenter.notificationCenter = self.notificationCenter
        self.viewContainer.frame = Constants.viewFrame
        self.notification.userInfo = [
            UIKeyboardFrameEndUserInfoKey : NSValue(cgRect:Constants.frame),
            UIKeyboardAnimationDurationUserInfoKey : NSNumber(value:Constants.duration)]
    }
    
    func testRegistersForNotifications() {
        var added:Bool = false
        self.notificationCenter.onAddObserver = {
            added = true
        }
        
        self.presenter.startListening()
        XCTAssertTrue(added, "Observer not added")
    }
    
    func testRemoveObserver() {
        var removed:Bool = false
        self.notificationCenter.onRemoveObserver = {
            removed = true
        }
        
        self.presenter = nil
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testAdjustOutlets() {
        let expectedConstant:CGFloat = -Constants.frame.height
        self.presenter.notificationCenter = NotificationCenter.default
        self.presenter.startListening()
        
        NotificationCenter.default.post(self.notification)
        XCTAssertEqual(self.layoutBottom.constant, expectedConstant, "Failed to adjust")
    }
}
