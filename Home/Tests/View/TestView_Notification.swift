import XCTest
import Canvas
import Shared
@testable import Home

class TestView_Notification:XCTestCase {
    private var view:Home.View!
    private var notificationCenter:MockNotificationCenter!
    private var presenter:MockPresenter!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.view = Home.View()
        self.notificationCenter = MockNotificationCenter()
        self.presenter = MockPresenter()
        self.project = MockProjectManagedProtocol()
        self.presenter.interactor = self.view.presenter.interactor
        self.presenter.viewModel = self.view.presenter.viewModel
        self.view.notificationCenter = self.notificationCenter
        self.view.presenter = self.presenter
        self.view.presenter.interactor.project = self.project
        self.view.presenter.canvas.project = self.project
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
