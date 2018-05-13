import XCTest
@testable import Home

class TestViewModelBuilder_Builders:XCTestCase {
    private var builder:ViewModelBuilder!
    private var viewModel:ViewModel!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.builder = ViewModelBuilder()
        self.project = MockProjectManagedProtocol()
        self.builder.builders.append(MockViewModelBuilderProtocol.self)
        self.builder.project = self.project
        self.viewModel = self.builder.buildViewModel()
    }
    
    func testCallsBuilders() {
        XCTAssertNotNil(MockViewModelBuilderProtocol.builder, "Builder not called")
    }
    
    func testBuilderHasProject() {
        XCTAssertNotNil(MockViewModelBuilderProtocol.builder?.project, "Project not injected")
    }
    
    func testBuilderHasViewModel() {
        XCTAssertNotNil(MockViewModelBuilderProtocol.builder?.viewModel, "View model not injected")
    }
}
