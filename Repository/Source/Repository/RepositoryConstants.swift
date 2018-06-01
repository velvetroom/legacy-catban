import Foundation

public struct RepositoryConstants {
    public struct Url {
        public static let directoryRoot:String = "iturbide.catban"
        static let directoryProjects:String = "Projects"
        static let boardName:String = "board"
        static let fileExtension:String = "catban"
    }
    
    struct Keys {
        struct Shared {
            static let identifier:String = "identifier"
        }
        
        struct Project {
            static let name:String = "name"
            static let columns:String = "columns"
        }
        
        struct Column {
            static let name:String = "name"
            static let cards:String = "cards"
            static let created:String = "created"
        }
        
        struct Card {
            static let content:String = "content"
            static let created:String = "created"
        }
    }
}
