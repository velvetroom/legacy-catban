import Foundation
import Domain

class Injection {
    class func configure() {
        Configuration.repositoryType = Repository.self
    }
    
    private init() { }
}
