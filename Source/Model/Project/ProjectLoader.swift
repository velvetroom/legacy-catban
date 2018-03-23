import Foundation

class ProjectLoader:ProjectLoaderProtocol {
    func load(completion:@escaping((Project) -> Void)) {
        let project:Project = Project.factoryNewProject()
        completion(project)
    }
}
