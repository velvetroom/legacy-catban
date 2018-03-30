import Foundation

extension LandingController {
    func loadDependencies() {
        self.loadProject { [weak self] (project:Project) in
            self?.project = project
            self?.reloadViewModel()
        }
    }
    
    func loadProject(completion:@escaping((Project) -> Void)) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.projectLoader.load { (project:Project) in
                DispatchQueue.main.async {
                    completion(project)
                }
            }
        }
    }
    
    func reloadViewModel() {
        guard
            let project:Project = self.project
        else {
            return
        }
        let viewModel:LandingViewModel = self.viewModelLoader.factoryWith(project:project)
        self.presenter.update(viewModel:viewModel)
    }
}
