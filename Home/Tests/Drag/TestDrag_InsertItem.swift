import XCTest
@testable import Home

class TestDrag_InsertItem:XCTestCase {
    private var model:Map!
    private var item:MapCard!
    private var viewColumnA:ViewColumn!
    private var viewColumnB:ViewColumn!
    private var viewCard:ViewCard!
    private var layoutColumnLeftA:NSLayoutConstraint!
    private var layoutColumnLeftB:NSLayoutConstraint!
    private var layoutCardLeft:NSLayoutConstraint!
    private var layoutCardTop:NSLayoutConstraint!
    private struct Constants {
        static let leftA:CGFloat = 0
        static let leftB:CGFloat = 500
        static let cardLeftA:CGRect = CGRect(x:10, y:0, width:100, height:10)
        static let cardLeftB:CGRect = CGRect(x:510, y:0, width:100, height:10)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Map()
        self.item = MapCard()
        self.viewColumnA = ViewColumn()
        self.viewColumnB = ViewColumn()
        self.viewCard = ViewCard()
        self.layoutCardLeft = NSLayoutConstraint()
        self.layoutCardTop = NSLayoutConstraint()
        self.layoutColumnLeftA = NSLayoutConstraint()
        self.layoutColumnLeftB = NSLayoutConstraint()
        self.viewColumnA.layoutLeft = self.layoutColumnLeftA
        self.viewColumnB.layoutLeft = self.layoutColumnLeftB
        self.layoutColumnLeftA.constant = Constants.leftA
        self.layoutColumnLeftB.constant = Constants.leftB
        self.viewCard.layoutLeft = self.layoutCardLeft
        self.viewCard.layoutTop = self.layoutCardTop
        self.item.view = self.viewCard
        let columnA:MapColumn = MapColumn()
        let columnB:MapColumn = MapColumn()
        columnA.view = self.viewColumnA
        columnB.view = self.viewColumnB
        self.model.columns = [columnA, columnB]
    }
    
    func testInsertItemIntoFirstColumn() {
        self.viewCard.frame = Constants.cardLeftA
        self.model.add(item:self.item)
        XCTAssertEqual(self.model.columns[0].items.count, 1, "Item not added")
    }
    
    func testInsertItemIntoSecondColumn() {
        self.viewCard.frame = Constants.cardLeftB
        self.model.add(item:self.item)
        XCTAssertEqual(self.model.columns[1].items.count, 1, "Item not added")
    }
    
    func testFirstColumnForItem() {
        self.viewCard.frame = Constants.cardLeftA
        let column:MapColumn = self.model.columnFor(item:self.item)
        XCTAssertEqual(column.view, self.viewColumnA, "Invalid column")
    }
    
    func testSecondColumnForItem() {
        self.viewCard.frame = Constants.cardLeftB
        let column:MapColumn = self.model.columnFor(item:self.item)
        XCTAssertEqual(column.view, self.viewColumnB, "Invalid column")
    }
}
