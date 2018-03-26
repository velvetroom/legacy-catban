import Foundation

extension LandingViewModelLoader {
    func factoryCollectionLayoutWith(project:Project) -> LandingViewModelCollectionLayout {
        var layout:LandingViewModelCollectionLayout = LandingViewModelCollectionLayout()
        for column:ProjectColumn in project.columns {
            let header:LandingViewModelCollectionLayoutHeader = self.factoryHeaderWith(column:column)
            layout.headers.append(header)
        }
        return layout
    }
    
    private func factoryHeaderWith(column:ProjectColumn) -> LandingViewModelCollectionLayoutHeader {
        
    }
}
