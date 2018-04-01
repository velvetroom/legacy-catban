import Foundation

class LandingViewModelLoaderCollection {
    func factoryWith(model:Landing) -> LandingViewModelCollection {
        var collection:LandingViewModelCollection = LandingViewModelCollection()
        if let project:ProjectProtocol = model.project {
            collection.sections = self.factorySectionsWith(project:project)
        }
        return collection
    }
    
    private func factorySectionsWith(project:ProjectProtocol) -> [LandingViewModelCollectionSection] {
        var sections:[LandingViewModelCollectionSection] = []
        for column:ProjectColumn in project.columns {
            var section:LandingViewModelCollectionSection = LandingViewModelCollectionSection()
            section.title = column.name
            section.items = self.factoryItemsWith(column:column)
            sections.append(section)
        }
        return sections
    }
    
    private func factoryItemsWith(column:ProjectColumn) -> [LandingViewModelCollectionItem] {
        var items:[LandingViewModelCollectionItem] = []
        for card:ProjectCard in column.cards {
            var item:LandingViewModelCollectionItem = LandingViewModelCollectionItem()
            item.title = card.title
            items.append(item)
        }
        return items
    }
}
