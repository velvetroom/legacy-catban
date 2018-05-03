import XCTest
@testable import catban

class TestWriterController_Notifications:XCTestCase {
    private var controller:WriterController<Writer>!
    private var notification:Notification!
    private var layoutBottom:NSLayoutConstraint!
    private struct Constants {
        static let name:String = "asd"
        static let frame:CGRect = CGRect(x:100, y:200, width:300, height:400)
        static let animationDuration:TimeInterval = 23123223.332
        static let viewFrame:CGRect = CGRect(x:0, y:0, width:1000, height:1000)
    }
    
    override func setUp() {
        super.setUp()
        self.controller = WriterController<Writer>()
        self.notification = Notification(name:Notification.Name.init(Constants.name))
        self.notification.userInfo = [
            UIKeyboardFrameEndUserInfoKey : NSValue(cgRect:Constants.frame),
            UIKeyboardAnimationDurationUserInfoKey : NSNumber(value:Constants.animationDuration)]
        self.layoutBottom = NSLayoutConstraint()
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        self.controller.view.frame = Constants.viewFrame
        self.controller.model.presenter.outlets.list.layoutBarBottom = self.layoutBottom
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testNotificatonUpdatesLayout() {
        self.controller.notifiedKeyboardChanged(sender:self.notification)
        XCTAssertEqual(self.layoutBottom.constant, -(Constants.viewFrame.height - Constants.frame.minY),
                       "Failed to update layout")
    }
    
    func testKeyboardHeightForNotification() {
        let height:CGFloat = self.controller.keyboardHeightFrom(notification:self.notification)
        XCTAssertEqual(-(Constants.viewFrame.height - Constants.frame.minY), height,
                       "Failed to return keyboard height")
    }
    
    func testHidingKeyboardHeightForNotification() {
        let viewFrame:CGRect = CGRect(x:0, y:0, width:100, height:Constants.frame.minY - 1)
        self.controller.view.frame = viewFrame
        let height:CGFloat = self.controller.keyboardHeightFrom(notification:self.notification)
        XCTAssertEqual(0, height, "Failed to hide keyboard")
    }
    
    func testKeyboardFrameFromNotification() {
        let rect:CGRect = self.controller.keyboardRectFrom(notification:self.notification)
        XCTAssertEqual(rect, Constants.frame, "Failed to extract rect from notification")
    }
    
    func testAnimationDurationFromNotification() {
        let duration:TimeInterval = self.controller.animationDurationFrom(notification:self.notification)
        XCTAssertEqual(duration, Constants.animationDuration, "Failed to extract animation duration")
    }
}
