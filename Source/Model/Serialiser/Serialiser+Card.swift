import Foundation

extension Serialiser {
    func cardArrayWith(column:ProjectColumn) -> [Any] {
        var array:[Any] = []
        for card:ProjectCard in column.cards {
            let item:[String:Any] = self.dictionaryWith(card:card)
            array.append(item)
        }
        return array
    }
    
    private func dictionaryWith(card:ProjectCard) -> [String:Any] {
        var dictionary:[String:Any] = [:]
        dictionary[Constants.Card.identifier] = card.identifier
        dictionary[Constants.Card.title] = card.title
        return dictionary
    }
}
