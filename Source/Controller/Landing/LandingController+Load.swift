import Foundation

extension LandingController {
    func loadDependencies() {
        self.loadProject { [weak self] (project:Project) in
            self?.project = project
            self?.reloadViewModel(reloadCollection:true)
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
    
    func reloadViewModel(reloadCollection:Bool) {
        guard
            let project:Project = self.project
        else {
            return
        }
        let viewModel:LandingViewModel = self.viewModelLoader.factoryViewModelWith(project:project)
        self.updateViewModel(viewModel:viewModel, reloadCollection:reloadCollection)
    }
    
    func updateViewModel(viewModel:LandingViewModel, reloadCollection:Bool) {
        self.updateOutlets(viewModel:viewModel)
        self.updateCollectionViewModel(viewModel:viewModel, reloadCollection:reloadCollection)
    }
    
    private func updateOutlets(viewModel:LandingViewModel) {
        self.title = viewModel.outlets.title
        self.presenter.outlets.list.imageLogo.isHidden = viewModel.outlets.logoHidden
    }
    
    private func updateCollectionViewModel(viewModel:LandingViewModel, reloadCollection:Bool) {
        self.presenter.outlets.list.layoutCollection.viewModel = viewModel.collectionLayout
        self.presenter.collection.dataSource.update(
            viewModel:viewModel.collection, reloadCollection:reloadCollection)
    }
}
