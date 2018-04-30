import Foundation

class WriterPresenter:WriterPresenterProtocol {
    var outlets:WriterPresenterOutletsProtocol
    
    init() {
        self.outlets = WriterPresenterOutlets()
    }
}
