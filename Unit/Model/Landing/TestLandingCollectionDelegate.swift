import XCTest
@testable import catban

class TestLandingCollectionDelegate:XCTestCase {
    private var delegate:LandingCollectionDelegate!
    private var viewModel:LandingViewModelCollection!
    private var viewCollection:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.delegate = LandingCollectionDelegate()
        self.viewModel = LandingViewModelCollection()
        self.viewCollection = MockLandingViewCollection()
        self.configureViewModel()
        self.delegate.viewModel = self.viewModel
    }
    
    func testLoad() {
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.delegate.viewModel, "Failed to load view model")
    }
    
    func testUsingViewModelForSections() {
        let sections:Int = self.delegate.numberOfSections(in:self.viewCollection)
        XCTAssertEqual(sections, self.viewModel.sections.count, "Invalid number of sections")
    }
    
    func testUsingViewModelForItems() {
        let items:Int = self.delegate.collectionView(self.viewCollection, numberOfItemsInSection:0)
        XCTAssertEqual(items, self.viewModel.sections[0].items.count, "Invalid number of items")
    }
    
    private func configureViewModel() {
        self.addSectionToViewModel(items:2)
        self.addSectionToViewModel(items:0)
    }
    
    private func addSectionToViewModel(items:Int) {
        var section:LandingViewModelCollectionSection = LandingViewModelCollectionSection()
        for _:Int in 0 ..< items {
            let item:LandingViewModelCollectionItem = LandingViewModelCollectionItem()
            section.items.append(item)
        }
        self.viewModel.sections.append(section)
    }
}
