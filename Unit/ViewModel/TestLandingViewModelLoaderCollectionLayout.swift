import XCTest
@testable import catban

class TestLandingViewModelLoaderCollectionLayout:XCTestCase {
    private var loader:LandingViewModelLoaderCollectionLayout!
    private var project:Project!
    
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
        self.validateHeaderFrames(viewModel:viewModel)
        self.validateHeaderIndexes(viewModel:viewModel)
        self.validateContentSize(viewModel:viewModel)
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
