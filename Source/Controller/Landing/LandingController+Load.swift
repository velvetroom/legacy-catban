import Foundation

extension LandingController {
    func loadProject(completion:@escaping((Project) -> Void)) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.loadProjectAndReturnToMain(completion:completion)
        }
    }
    
    private func loadProjectAndReturnToMain(completion:@escaping((Project) -> Void)) {
        self.projectLoader.load { [weak self] (project:Project) in
            self?.projectLoaded(project:project, completion:completion)
        }
    }
    
    private func projectLoaded(project:Project, completion:@escaping((Project) -> Void)) {
        DispatchQueue.main.async {
            completion(project)
        }
    }
}
