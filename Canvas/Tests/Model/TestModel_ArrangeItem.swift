import XCTest
@testable import Canvas

class TestModel_ArrangeItem:XCTestCase {
    private var model:Model!
    private var mapDelegate:MapDelegateProtocol!
    private var projectOrder:MockProjectOrderProtocol!
    private var editor:MockCanvasEditorProtocol!
    private var columnA:MapColumn!
    private var columnB:MapColumn!
    private var item:MapCard!
    private var viewColumnA:ViewItem!
    private var viewColumnB:ViewItem!
    private var viewItem:ViewItem!
    private var layoutLeftColumnA:NSLayoutConstraint!
    private var layoutWidthColumnA:NSLayoutConstraint!
    private var layoutTopColumnA:NSLayoutConstraint!
    private var layoutHeightColumnA:NSLayoutConstraint!
    private var layoutLeftColumnB:NSLayoutConstraint!
    private var layoutWidthColumnB:NSLayoutConstraint!
    private var layoutTopColumnB:NSLayoutConstraint!
    private var layoutHeightColumnB:NSLayoutConstraint!
    private var layoutLeftItem:NSLayoutConstraint!
    private var layoutWidthItem:NSLayoutConstraint!
    private var layoutTopItem:NSLayoutConstraint!
    private var layoutHeightItem:NSLayoutConstraint!
    private struct Constants {
        static let columnWidth:CGFloat = 200
        static let itemWidth:CGFloat = 100
        static let columnALeft:CGFloat = 500
        static let columnBLeft:CGFloat = 900
    }
    
    override func setUp() {
        super.setUp()
        self.configureColumns()
        self.configureItem()
        self.configureModel()
    }
    
    func testAddItemWidthLeftOffset() {
        self.layoutLeftItem.constant = 0
        
        self.model.arrange(item:self.item)
        XCTAssertNotNil(self.columnA.childItem, "Item not added")
    }
    
    func testAddItemWidthRightOffset() {
        self.layoutLeftItem.constant = 2000
        
        self.model.arrange(item:self.item)
        XCTAssertNotNil(self.columnB.childItem, "Item not added")
    }
    
    func testAddItemToFirstColumn() {
        self.layoutLeftItem.constant = Constants.columnALeft + 10
        
        self.model.arrange(item:self.item)
        XCTAssertNotNil(self.columnA.childItem, "Item not added")
    }
    
    func testAddItemToSecondColumn() {
        self.layoutLeftItem.constant = Constants.columnBLeft + 10
        
        self.model.arrange(item:self.item)
        XCTAssertNotNil(self.columnB.childItem, "Item not added")
    }
    
    func testArrangeSavesProject() {
        var called:Bool = false
        self.model.canvas = editor
        self.editor.onSave = {
            called = true
        }
        
        self.model.arrange(item:self.item)
        XCTAssertTrue(called, "Not saved")
    }
    
    private func configureModel() {
        self.model = Model()
        self.mapDelegate = MockMapDelegateProtocol()
        self.projectOrder = MockProjectOrderProtocol()
        self.editor = MockCanvasEditorProtocol()
        self.model.mapDelegate = self.mapDelegate
        self.model.projectOrder = self.projectOrder
        self.model.canvas = self.editor
        self.model.columns = [self.columnA, self.columnB]
    }
    
    private func configureColumns() {
        self.configureColumnA()
        self.configureColumnB()
    }
    
    private func configureItem() {
        self.item = MapCard()
        self.viewItem = ViewItem()
        self.layoutTopItem = NSLayoutConstraint()
        self.layoutLeftItem = NSLayoutConstraint()
        self.layoutWidthItem = NSLayoutConstraint()
        self.layoutHeightItem = NSLayoutConstraint()
        self.item.view = self.viewItem
        self.viewItem.layoutTop = self.layoutTopItem
        self.viewItem.layoutLeft = self.layoutLeftItem
        self.viewItem.layoutWidth = self.layoutWidthItem
        self.viewItem.layoutHeight = self.layoutHeightItem
        self.layoutWidthItem.constant = Constants.itemWidth
    }
    
    private func configureColumnA() {
        self.columnA = MapColumn()
        self.viewColumnA = ViewItem()
        self.layoutTopColumnA = NSLayoutConstraint()
        self.layoutLeftColumnA = NSLayoutConstraint()
        self.layoutWidthColumnA = NSLayoutConstraint()
        self.layoutHeightColumnA = NSLayoutConstraint()
        self.columnA.view = self.viewColumnA
        self.viewColumnA.layoutTop = self.layoutTopColumnA
        self.viewColumnA.layoutLeft = self.layoutLeftColumnA
        self.viewColumnA.layoutWidth = self.layoutWidthColumnA
        self.viewColumnA.layoutHeight = self.layoutHeightColumnA
        self.layoutLeftColumnA.constant = Constants.columnALeft
        self.layoutWidthColumnA.constant = Constants.columnWidth
    }
    
    private func configureColumnB() {
        self.columnB = MapColumn()
        self.viewColumnB = ViewItem()
        self.layoutTopColumnB = NSLayoutConstraint()
        self.layoutLeftColumnB = NSLayoutConstraint()
        self.layoutWidthColumnB = NSLayoutConstraint()
        self.layoutHeightColumnB = NSLayoutConstraint()
        self.columnB.view = self.viewColumnB
        self.viewColumnB.layoutTop = self.layoutTopColumnB
        self.viewColumnB.layoutLeft = self.layoutLeftColumnB
        self.viewColumnB.layoutWidth = self.layoutWidthColumnB
        self.viewColumnB.layoutHeight = self.layoutHeightColumnB
        self.layoutLeftColumnB.constant = Constants.columnBLeft
        self.layoutWidthColumnB.constant = Constants.columnWidth
    }
}
