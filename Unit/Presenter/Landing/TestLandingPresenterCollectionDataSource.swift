import XCTest
@testable import catban

class TestLandingPresenterCollectionDataSource:XCTestCase {
    private var dataSource:LandingPresenterCollectionDataSource!
    private var controller:LandingController!
    private var viewCollection:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.dataSource = LandingPresenterCollectionDataSource()
        self.controller = LandingController()
        self.viewCollection = MockLandingViewCollection()
        self.dataSource.delegate = self.controller
        self.configureViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.dataSource, "Failed to load data source")
        XCTAssertNotNil(self.dataSource.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.viewCollection, "Failed to load collection")
        XCTAssertFalse(self.dataSource.viewModel.sections.isEmpty, "Failed to configure view model")
    }
    
    func testUsingViewModelForSections() {
        let sections:Int = self.dataSource.numberOfSections(in:self.viewCollection)
        XCTAssertEqual(sections, self.dataSource.viewModel.sections.count, "Invalid number of sections")
    }
    
    func testUsingViewModelForItems() {
        let items:Int = self.dataSource.collectionView(self.viewCollection, numberOfItemsInSection:0)
        XCTAssertEqual(items, self.dataSource.viewModel.sections[0].items.count, "Invalid number of items")
    }
    
    func testConfigureHeader() {
        let header:LandingViewCollectionHeader = LandingViewCollectionHeader(frame:CGRect.zero)
        self.dataSource.configure(header:header, for:0)
        let title:String? = header.labelTitle.text
        XCTAssertNotNil(title, "There is no title in header")
        XCTAssertEqual(title, self.dataSource.viewModel.sections.first?.title, "Failed to assign title")
    }
    
    func testConfigureCell() {
        let index:IndexPath = IndexPath(item:0, section:0)
        let cell:LandingViewCollectionCell = LandingViewCollectionCell(frame:CGRect.zero)
        self.dataSource.configure(cell:cell, for:index)
        let title:String? = cell.labelTitle.text
        XCTAssertNotNil(title, "There is no title in cell")
        XCTAssertEqual(
            title,
            self.dataSource.viewModel.sections.first?.items.first?.title,
            "Failed to assign cell title")
    }
    
    func testSetDelegateForCellInConfigure() {
        let index:IndexPath = IndexPath(item:0, section:0)
        let cell:LandingViewCollectionCell = LandingViewCollectionCell(frame:CGRect.zero)
        
        self.dataSource.configure(cell:cell, for:index)
        
        XCTAssertNotNil(cell.delegate, "Failed to assign delegate to cell")
    }
    
    func testSetIndexPathInCellConfigure() {
        let index:IndexPath = IndexPath(item:4, section:0)
        let cell:LandingViewCollectionCell = LandingViewCollectionCell(frame:CGRect.zero)
        
        self.dataSource.configure(cell:cell, for:index)
        
        XCTAssertEqual(index, cell.indexPath, "Failed to assign indexPath")
    }
    
    func testSetDelegateForHeaderInConfigure() {
        let index:Int = 0
        let header:LandingViewCollectionHeader = LandingViewCollectionHeader(frame:CGRect.zero)
        
        self.dataSource.configure(header:header, for:index)
        
        XCTAssertNotNil(header.delegate, "Failed to assign delegate to header")
    }
    
    func testSetSectionForHeaderInConfigure() {
        let index:Int = 0
        let header:LandingViewCollectionHeader = LandingViewCollectionHeader(frame:CGRect.zero)
        header.section = 999324
        
        self.dataSource.configure(header:header, for:index)
        
        XCTAssertEqual(header.section, index, "Failed to update section on header")
    }
    
    private func configureViewModel() {
        let sectionA:LandingViewModelCollectionSection = self.sectionWith(items:5)
        let sectionB:LandingViewModelCollectionSection = self.sectionWith(items:0)
        var viewModel:LandingViewModelCollection = LandingViewModelCollection()
        viewModel.sections = [
            sectionA,
            sectionB]
        
        self.dataSource.viewModel = viewModel
    }
    
    private func sectionWith(items:Int) -> LandingViewModelCollectionSection {
        var section:LandingViewModelCollectionSection = LandingViewModelCollectionSection()
        section.title = "section\(self.dataSource.viewModel.sections.count)"
        for _:Int in 0 ..< items {
            let item:LandingViewModelCollectionItem = LandingViewModelCollectionItem()
            section.items.append(item)
        }
        return section
    }
}
