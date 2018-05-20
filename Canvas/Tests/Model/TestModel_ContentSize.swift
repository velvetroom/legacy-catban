import XCTest
@testable import Canvas

class TestModel_ContentSize:XCTestCase {
    private var model:Model!
    private struct Constants {
        static let itemAMaxY:CGFloat = 145
        static let itemBMaxY:CGFloat = 178
        static let itemCMaxY:CGFloat = 146
    }
    
    override func setUp() {
        super.setUp()
        self.model = Model()
    }
    
    func testMaxHeight() {
        
    }
    
    private func configureColumnsForMaxHeight() {
        
    }
}
