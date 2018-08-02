import Foundation
import Domain

class Injection {
    class func configure() {
        Configuration.repository = RepositoryService.self
    }
    
    private init() { }
}
