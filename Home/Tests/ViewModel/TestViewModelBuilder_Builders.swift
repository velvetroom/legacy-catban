import XCTest
@testable import Home

class TestViewModelBuilder_Builders:XCTestCase {
    private var builder:ViewModelBuilder!
    private var viewModel:ViewModel!
    private var project:MockProjectManagedProtocol!
    private struct Contants {
        static let initialName:String = "lorem ipsum"
        static let updatedName:String = "hello world"
    }
    
    override func setUp() {
        super.setUp()
        self.builder = ViewModelBuilder()
        self.project = MockProjectManagedProtocol()
        self.builder.builders = [MockViewModelBuilderProtocol.self]
        self.builder.project = self.project
    }
    
    func testOnBuildIsCalled() {
        var called:Bool = false
        MockViewModelBuilderProtocol.onBuild = { (builder:MockViewModelBuilderProtocol) -> ViewModel in
            called = true
            return ViewModel()
        }
        
        let _:ViewModel = self.builder.buildViewModel()
        XCTAssertTrue(called, "Not called")
    }
    
    func testInjectViewModel() {
        MockViewModelBuilderProtocol.onBuild = { (builder:MockViewModelBuilderProtocol) -> ViewModel in
            XCTAssertNotNil(builder.viewModel, "Failed to inject original view model")
            return ViewModel()
        }
        let _:ViewModel = self.builder.buildViewModel()
    }
    
    func testInjectProject() {
        MockViewModelBuilderProtocol.onBuild = { (builder:MockViewModelBuilderProtocol) -> ViewModel in
            XCTAssertNotNil(builder.project, "Failed to inject project")
            return ViewModel()
        }
        let _:ViewModel = self.builder.buildViewModel()
    }
    
    func testOriginalViewModelReceived() {
        MockViewModelBuilderProtocol.onBuild = { (builder:MockViewModelBuilderProtocol) -> ViewModel in
            XCTAssertEqual(builder.viewModel.view.title, Contants.initialName, "Invalid view model received")
            return ViewModel()
        }

        self.builder.viewModel.view.title = Contants.initialName
        let _:ViewModel = self.builder.buildViewModel()
    }
    
    func testUpdatedViewModelUsed() {
        MockViewModelBuilderProtocol.onBuild = { (builder:MockViewModelBuilderProtocol) -> ViewModel in
            var viewModel:ViewModel = ViewModel()
            viewModel.view.title = Contants.updatedName
            return viewModel
        }
        
        self.builder.viewModel.view.title = Contants.initialName
        let finalViewModel:ViewModel = self.builder.buildViewModel()
        XCTAssertEqual(finalViewModel.view.title, Contants.updatedName, "Final view model not updated")
    }
}
