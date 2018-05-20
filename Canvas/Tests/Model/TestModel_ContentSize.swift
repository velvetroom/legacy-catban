import XCTest
@testable import Canvas

class TestModel_ContentSize:XCTestCase {
    private var model:Model!
    private struct inConstants {
        static let columnHeightA:CGFloat = 145
        static let columnHeightB:CGFloat = 178
        static let columnHeightC:CGFloat = 146
        static let columnMaxCC:CGFloat = 300
    }
    
    override func setUp() {
        super.setUp()
        self.model = Model()
        self.configureColumns()
    }
    
    func testContentHeight() {
        XCTAssertEqual(self.model.contentHeight, inConstants.columnHeightB, "Invalid height")
    }
    
    func testContentWidth() {
        let expected:CGFloat = inConstants.columnMaxCC + Constants.Board.paddingHorizontal
        XCTAssertEqual(self.model.contentWidth, expected, "Invalid width")
    }
    
    private func configureColumns() {
        let columnA:MockMapColumnProtocol = MockMapColumnProtocol()
        let columnB:MockMapColumnProtocol = MockMapColumnProtocol()
        let columnC:MockMapColumnProtocol = MockMapColumnProtocol()
        columnA.height = inConstants.columnHeightA
        columnB.height = inConstants.columnHeightB
        columnC.height = inConstants.columnHeightC
        columnC.maxX = inConstants.columnMaxCC
        self.model.columns = [columnA, columnB, columnC]
    }
}
