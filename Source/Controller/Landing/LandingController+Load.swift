import Foundation

extension LandingController {
    func loadDependencies() {
        self.loadProject { [weak self] (project:Project) in
            self?.project = project
            self?.reloadViewModel()
            self?.reloadCollectionView()
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
        let viewModel:LandingViewModel = self.viewModelLoader.factoryViewModelWith(project:project)
        self.updateViewModel(viewModel:viewModel)
    }
    
    func reloadCollectionView() {
        self.outlets.viewCollection.reloadData()
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
        self.presenter.collection.dataSource.viewModel = viewModel.collection
        self.outlets.layoutCollection.viewModel = viewModel.collectionLayout
    }
}
