import Foundation

extension Landing {
    func load() {
        self.loadProject { [weak self] (project:ProjectProtocol) in
            self?.project = project
            self?.reloadViewModel()
        }
    }
    
    func loadProject(completion:@escaping((ProjectProtocol) -> Void)) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.projectLoader.load { (project:Project) in
                DispatchQueue.main.async {
                    completion(project)
                }
            }
        }
    }
    
    func reloadViewModel() {
        let viewModel:LandingViewModel = self.viewModelLoader.factoryWith(model:self)
        self.presenter.update(viewModel:viewModel)
    }
}
