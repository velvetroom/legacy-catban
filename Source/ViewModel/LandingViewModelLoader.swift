import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    func factoryViewModelWith(project:Project) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.collection = self.factoryCollectionWith(project:project)
        return viewModel
    }
    
    private func factoryCollectionWith(project:Project) -> LandingViewModelCollection {
        var collection:LandingViewModelCollection = LandingViewModelCollection()
        collection.sections = self.factoryCollectionSectionsWith(project:project)
        return collection
    }
    
    private func factoryCollectionSectionsWith(project:Project) -> [LandingViewModelCollectionSection] {
        var sections:[LandingViewModelCollectionSection] = []
        for column:ProjectColumn in project.columns {
            var section:LandingViewModelCollectionSection = LandingViewModelCollectionSection()
            section.title = column.name
            sections.append(section)
        }
        return sections
    }
}
