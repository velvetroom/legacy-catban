import Foundation

class Writer:WriterProtocol {
    var presenter:WriterPresenterProtocol
    var text:String
    var onFinish:((String) -> Void)?
    
    init() {
        self.presenter = WriterPresenter()
        self.text = String()
    }
    
    func finishedWriting() {
        self.onFinish?(self.text)
    }
}
