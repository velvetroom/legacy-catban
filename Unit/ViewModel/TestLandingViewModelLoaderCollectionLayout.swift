import XCTest
@testable import catban

class TestLandingViewModelLoaderCollectionLayout:XCTestCase {
    private var loader:LandingViewModelLoaderCollectionLayout!
    private var project:Project!
    private var totalCards:Int {
        get {
            var total:Int = 0
            for column:ProjectColumn in self.project.columns {
                total += column.cards.count
            }
            return total
        }
    }
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderCollectionLayout()
        self.project = Project.factoryNewProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
    
    func testFactory() {
        let viewModel:LandingViewModelCollectionLayout = self.loader.factoryWith(project:self.project)
        XCTAssertNotNil(viewModel, "Failed to factory view model")
        self.validate(viewModel:viewModel)
    }
    
    private func validate(viewModel:LandingViewModelCollectionLayout) {
        self.validateTotalHeaders(viewModel:viewModel)
        self.validateTotalCells(viewModel:viewModel)
        self.validateHeaderFrames(viewModel:viewModel)
        self.validateHeaderIndexes(viewModel:viewModel)
        self.validateCellFrames(viewModel:viewModel)
        self.validateContentSize(viewModel:viewModel)
    }
    
    private func validateTotalHeaders(viewModel:LandingViewModelCollectionLayout) {
        let countColumns:Int = self.project.columns.count
        let countHeaders:Int = viewModel.headers.count
        XCTAssertEqual(countColumns, countHeaders, "Incorrect amount of headers")
    }
    
    private func validateTotalCells(viewModel:LandingViewModelCollectionLayout) {
        let countCells:Int = self.totalCellsFrom(viewModel:viewModel)
        XCTAssertEqual(self.totalCards, countCells, "Incorrect amount of cells")
    }
    
    private func totalCellsFrom(viewModel:LandingViewModelCollectionLayout) -> Int {
        var total:Int = 0
        for header:LandingViewModelCollectionLayoutHeader in viewModel.headers {
            total += header.cells.count
        }
        return total
    }
    
    private func validateHeaderFrames(viewModel:LandingViewModelCollectionLayout) {
        let count:Int = viewModel.headers.count
        for indexOutside:Int in 0 ..< count - 1 {
            
            let headerOutside:LandingViewModelCollectionLayoutHeader = viewModel.headers[indexOutside]
            XCTAssertNotEqual(headerOutside.frame, CGRect.zero, "Error: using zero frame")
            for indexInside:Int in indexOutside + 1 ..< count {
                let headerInside:LandingViewModelCollectionLayoutHeader = viewModel.headers[indexInside]
                let intersects:Bool = headerOutside.frame.intersects(headerInside.frame)
                XCTAssertFalse(intersects, "Header frames are intersecting")
            }
        }
    }
    
    private func validateCellFrames(viewModel:LandingViewModelCollectionLayout) {
        for header:LandingViewModelCollectionLayoutHeader in viewModel.headers {
            self.validateCellFramesFor(header:header)
        }
    }
    
    private func validateCellFramesFor(header:LandingViewModelCollectionLayoutHeader) {
        for cell:LandingViewModelCollectionLayoutCell in header.cells {
            XCTAssertNotEqual(cell.frame, CGRect.zero, "Error: using zero frame")
            XCTAssertTrue(header.frame.contains(cell.frame), "Cell frame is outside header frame")
        }
    }
    
    private func validateHeaderIndexes(viewModel:LandingViewModelCollectionLayout) {
        let count:Int = viewModel.headers.count
        for indexOutside:Int in 0 ..< count - 1 {
            
            let headerOutside:LandingViewModelCollectionLayoutHeader = viewModel.headers[indexOutside]
            for indexInside:Int in indexOutside + 1 ..< count {
                let headerInside:LandingViewModelCollectionLayoutHeader = viewModel.headers[indexInside]
                XCTAssertNotEqual(headerOutside.index, headerInside.index, "Header indexes are repeating")
            }
        }
    }
    
    private func validateContentSize(viewModel:LandingViewModelCollectionLayout) {
        let contentMaxX:CGFloat = viewModel.contentSize.width
        let contentMaxY:CGFloat = viewModel.contentSize.height
        for header:LandingViewModelCollectionLayoutHeader in viewModel.headers {
            let headerMaxX:CGFloat = header.frame.maxX
            let headerMaxY:CGFloat = header.frame.maxY
            XCTAssertTrue(headerMaxX < contentMaxX, "Header is greater than content")
            XCTAssertTrue(headerMaxY < contentMaxY, "Header is greater than content")
        }
    }
}
