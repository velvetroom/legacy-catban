import XCTest
@testable import Card
@testable import Shared

class TestPresenterKeyboard:XCTestCase {
    private var presenter:PresenterKeyboard!
    private var view:Shared.View!
    private var viewText:ViewText!
    private var layout:NSLayoutConstraint!
    private struct Constants {
        static let duration:TimeInterval = 0
        static let viewFrame:CGRect = CGRect(x:0, y:0, width:1000, height:1000)
        static let frame:CGRect = CGRect(x:100, y:200, width:300, height:400)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterKeyboard()
        self.view = Shared.View()
        self.viewText = ViewText()
        self.layout = NSLayoutConstraint()
        self.presenter.outlets = PresenterOutlets()
        self.presenter.notification = Notification(name:Notification.Name.init(String()))
        self.presenter.notification.userInfo = [
            UIKeyboardFrameEndUserInfoKey : NSValue(cgRect:Constants.frame),
            UIKeyboardAnimationDurationUserInfoKey : NSNumber(value:Constants.duration)]
        self.presenter.outlets.view = self.view
        self.presenter.outlets.viewText = self.viewText
        self.view.view.frame = Constants.viewFrame
        self.viewText.layoutBottom = self.layout
    }
    
    func testAdjustOutlets() {
        let expectedConstant:CGFloat = -(Constants.viewFrame.height - Constants.frame.minY)
        self.presenter.adjustOutlets()
        XCTAssertEqual(self.layout.constant, expectedConstant, "Failed to adjust")
    }
}
