import XCTest
@testable import catban

class TestLandingPresenterCollectionDataSource:XCTestCase {
    private var dataSource:LandingPresenterCollectionDataSource!
    private var viewCollection:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.dataSource = LandingPresenterCollectionDataSource()
        self.viewCollection = MockLandingViewCollection()
        self.configureViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.dataSource, "Failed to load data source")
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
    
    private func configureViewModel() {
        self.addSectionToViewModel(items:2)
        self.addSectionToViewModel(items:0)
    }
    
    private func addSectionToViewModel(items:Int) {
        var section:LandingViewModelCollectionSection = LandingViewModelCollectionSection()
        section.title = "section\(self.dataSource.viewModel.sections.count)"
        for _:Int in 0 ..< items {
            let item:LandingViewModelCollectionItem = LandingViewModelCollectionItem()
            section.items.append(item)
        }
        self.dataSource.viewModel.sections.append(section)
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
}
