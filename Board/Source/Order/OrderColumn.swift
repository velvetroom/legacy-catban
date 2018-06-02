import Foundation

public struct OrderColumn {
    public var identifier:String
    public var cards:[OrderCard]
    
    public init() {
        self.identifier = String()
        self.cards = []
    }
}
