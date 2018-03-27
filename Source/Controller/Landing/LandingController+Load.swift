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
        self.loadViewModel { [weak self] (viewModel:LandingViewModel) in
            self?.updateViewModel(viewModel:viewModel)
        }
    }
    
    func loadViewModel(completion:@escaping((LandingViewModel) -> Void)) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            guard
                let project:Project = self?.project,
                let viewModel:LandingViewModel = self?.viewModelLoader.factoryViewModelWith(project:project)
            else {
                return
            }
            DispatchQueue.main.async {
                completion(viewModel)
            }
        }
    }
    
    func updateViewModel(viewModel:LandingViewModel) {
        self.updateOutlets(viewModel:viewModel)
        self.updateCollectionViewModel(viewModel:viewModel)
    }
    
    private func updateOutlets(viewModel:LandingViewModel) {
        self.title = viewModel.outlets.title
        self.outlets.imageLogo.isHidden = viewModel.outlets.logoHidden
    }
    
    private func updateCollectionViewModel(viewModel:LandingViewModel) {
        self.presenterCollection.viewModel = viewModel.collection
        self.outlets.layoutCollection.viewModel = viewModel.collectionLayout
        self.outlets.viewCollection.reloadData()
    }
}
