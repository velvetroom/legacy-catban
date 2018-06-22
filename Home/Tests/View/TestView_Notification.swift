import XCTest
@testable import Home

class TestView_Notification:XCTestCase {
    private var view:View!
    private var notificationCenter:MockNotificationCenter!
    private var presenter:MockPresenter!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.notificationCenter = MockNotificationCenter()
        self.presenter = MockPresenter()
        self.view.notificationCenter = self.notificationCenter
    }
    
    func testRemoveObserverFromNotificationCenter() {
        var removed:Bool = false
        self.notificationCenter.onRemoveObserver = { removed = true }
        self.view = nil
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testNotifyOrientationChange() {
        var notified:Bool = false
        self.presenter.onOrientationChange = { notified = true }
        self.view.notificationCenter = NotificationCenter.default
        self.view.didLoad()
        NotificationCenter.default.post(Notification(name:Notification.Name.UIDeviceOrientationDidChange))
        XCTAssertTrue(notified, "Not notified")
    }
}
