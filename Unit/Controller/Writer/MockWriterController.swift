import UIKit
@testable import catban

class MockWriterController:WriterController {
    var returnPresentingController:UIViewController?
    
    override var presentingViewController:UIViewController? {
        get {
            return self.returnPresentingController
        }
    }
}
