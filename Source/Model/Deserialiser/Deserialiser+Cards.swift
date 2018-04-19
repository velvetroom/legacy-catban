import Foundation

extension Deserialiser {
    func parseCardsWith(dictionary:[String:Any]) throws -> [ProjectCard] {
        guard
            let array:[Any] = dictionary[Serialiser.Constants.Column.cards] as? [Any]
        else {
            throw ErrorRepository.malformedData
        }
        return try self.parseCardsWith(array:array)
    }
    
    private func parseCardsWith(array:[Any]) throws -> [ProjectCard] {
        var cards:[ProjectCard] = []
        for item:Any in array {
            let card:ProjectCard = try self.parseCardWith(item:item)
            cards.append(card)
        }
        return cards
    }
    
    private func parseCardWith(item:Any) throws -> ProjectCard {
        guard
            let rawCard:[String:Any] = item as? [String:Any]
        else {
            throw ErrorRepository.malformedData
        }
        return try self.parseCardWith(dictionary:rawCard)
    }
    
    private func parseCardWith(dictionary:[String:Any]) throws -> ProjectCard {
        guard
            let title:String = dictionary[Serialiser.Constants.Card.title] as? String
        else {
            throw ErrorRepository.malformedData
        }
        let card:ProjectCard = ProjectCard()
        card.title = title
        return card
    }
}
