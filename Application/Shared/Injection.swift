import Foundation
import Domain

class Injection {
    class func configure() {
        Configuration.repository = Repository.self
    }
    
    private init() { }
}
