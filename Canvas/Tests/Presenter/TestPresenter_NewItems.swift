import XCTest
@testable import Canvas
@testable import Board

class TestPresenter_NewItems:XCTestCase {
    private var presenter:Presenter!
    private var model:Model!
    private var mapDelegate:MockMapDelegateProtocol!
    private var project:MockProjectProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.model = Model()
        self.mapDelegate = MockMapDelegateProtocol()
        self.project = MockProjectProtocol()
        self.model.mapDelegate = self.mapDelegate
        self.presenter.project = self.project
        self.presenter.model = self.model
    }
    
    func testNoNewCard() {
        self.presenter.refresh()
        XCTAssertEqual(self.totalViewsOfType(viewType:ViewNewCard.self), 0, "Should not be new cards")
        XCTAssertEqual(self.totalMapItemsOfType(mapType:MapNewCard.self), 0, "Should not be new cards")
    }
    
    func testOneNewCard() {
        self.project.columns.append(MockColumnProtocol())
        self.presenter.refresh()
        XCTAssertEqual(self.totalViewsOfType(viewType:ViewNewCard.self), 1, "Should be 1 new cards")
        XCTAssertEqual(self.totalMapItemsOfType(mapType:MapNewCard.self), 1, "Should be 1 new cards")
    }
    
    func testOneNewCardOnManyColumns() {
        self.project.columns.append(MockColumnProtocol())
        self.project.columns.append(MockColumnProtocol())
        self.project.columns.append(MockColumnProtocol())
        self.presenter.refresh()
        XCTAssertEqual(self.totalViewsOfType(viewType:ViewNewCard.self), 1, "Should be 1 new cards")
        XCTAssertEqual(self.totalMapItemsOfType(mapType:MapNewCard.self), 1, "Should be 1 new cards")
    }
    
    func testNewColumn() {
        self.presenter.refresh()
        XCTAssertEqual(self.totalViewsOfType(viewType:ViewNewColumn.self), 1, "Should be 1 new column")
    }
    
    func testNewColumnOnManyColumns() {
        self.project.columns.append(MockColumnProtocol())
        self.project.columns.append(MockColumnProtocol())
        self.project.columns.append(MockColumnProtocol())
        self.presenter.refresh()
        XCTAssertEqual(self.totalViewsOfType(viewType:ViewNewColumn.self), 1, "Should be 1 new column")
    }
    
    private func totalMapItemsOfType<MapType:MapItemProtocol>(mapType:MapType.Type) -> Int {
        var count:Int = 0
        let model:Model = self.presenter.model as! Model
        for column:MapColumnProtocol in model.columns {
            guard
                let column:MapColumn = column as? MapColumn
            else { continue }
            for child:MapItemProtocol in column.children {
                if let _:MapType = child as? MapType {
                    count += 1
                }
            }
        }
        return count
    }
    
    private func totalViewsOfType<ViewType:UIView>(viewType:ViewType.Type) -> Int {
        var count:Int = 0
        for subView:UIView in self.presenter.view.content.subviews {
            if let _:ViewType = subView as? ViewType {
                count += 1
            }
        }
        return count
    }
}
