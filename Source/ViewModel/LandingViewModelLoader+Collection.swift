import Foundation

extension LandingViewModelLoader {
    func factoryCollectionWith(project:Project) -> LandingViewModelCollection {
        var collection:LandingViewModelCollection = LandingViewModelCollection()
        collection.sections = self.factoryCollectionSectionsWith(project:project)
        return collection
    }
    
    private func factoryCollectionSectionsWith(project:Project) -> [LandingViewModelCollectionSection] {
        var sections:[LandingViewModelCollectionSection] = []
        for column:ProjectColumn in project.columns {
            var section:LandingViewModelCollectionSection = LandingViewModelCollectionSection()
            section.title = column.name
            section.items = self.factoryCollectionItemsWith(column:column)
            sections.append(section)
        }
        return sections
    }
    
    private func factoryCollectionItemsWith(column:ProjectColumn) -> [LandingViewModelCollectionItem] {
        var items:[LandingViewModelCollectionItem] = []
        for card:ProjectCard in column.cards {
            var item:LandingViewModelCollectionItem = LandingViewModelCollectionItem()
            item.title = card.title
            items.append(item)
        }
        return items
    }
}
