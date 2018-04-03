import Foundation

class Writer:WriterProtocol {
    var presenter:WriterPresenterProtocol
    var text:String
    
    init() {
        self.presenter = WriterPresenter()
        self.text = String()
    }
}
