import Foundation
@testable import catban

class MockProjectLoader:ProjectLoaderProtocol {
    var onLoadCalled:(() -> Void)?
    func load(completion:@escaping((Project) -> Void)) {
        self.onLoadCalled?()
        
        let project:Project = Project.factoryNewProject()
        completion(project)
    }
}
