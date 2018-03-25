import Foundation

extension LandingController {
    func loadDependencies() {
        self.loadProject { [weak self] (project:Project) in
            self?.project = project
            self?.loadViewModel { [weak self] (viewModel:LandingViewModel) in
                
            }
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
    
    func loadViewModel(completion:@escaping((LandingViewModel) -> Void)) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            guard
                let project:Project = self?.project
            else {
                return
            }
            self?.viewModelLoader.load(project:project) { (viewModel:LandingViewModel) in
                DispatchQueue.main.async {
                    completion(viewModel)
                }
            }
        }
    }
}
