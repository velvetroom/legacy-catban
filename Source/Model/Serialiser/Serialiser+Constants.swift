import Foundation

extension Serialiser {
    struct Constants {
        struct User {
            static let identifier:String = "identifier"
            static let projectIdentifier:String = "project"
        }
        
        struct Project {
            static let identifier:String = "identifier"
            static let name:String = "name"
            static let columns:String = "columns"
            static let history:String = "history"
        }
        
        struct Column {
            static let identifier:String = "identifier"
            static let name:String = "name"
            static let cards:String = "cards"
        }
        
        struct Card {
            static let identifier:String = "identifier"
            static let title:String = "title"
        }
        
        struct History {
            static let created:String = "created"
            static let card:String = "card"
        }
    }
}
