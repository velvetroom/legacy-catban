import Foundation
@testable import catban

class MockWriterProtocol:WriterProtocol {
    var presenter:WriterPresenterProtocol
    var text:String
    var onFinish:((String) -> Void)?
    
    required init() {
        self.presenter = WriterPresenter()
        self.text = String()
    }
    
    func finishedWriting() {
        self.onFinish?(self.text)
    }
}
