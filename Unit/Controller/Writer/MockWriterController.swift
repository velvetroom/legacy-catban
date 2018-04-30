import UIKit
@testable import catban

class MockWriterController:WriterController<MockWriterProtocol> {
    var returnPresentingController:UIViewController?
    
    override var presentingViewController:UIViewController? {
        get {
            return self.returnPresentingController
        }
    }
}
