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
        }
        struct Column {
            static let name:String = "name"
            static let cards:String = "cards"
        }
    }
}
