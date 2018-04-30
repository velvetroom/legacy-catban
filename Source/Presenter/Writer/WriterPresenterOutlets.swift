import Foundation

class WriterPresenterOutlets:WriterPresenterOutletsProtocol {
    var list:WriterPresenterOutletsList
    
    init() {
        self.list = WriterPresenterOutletsList()
    }
}
