import Foundation

extension Stats {
    class func factoryItems() -> [StatsItemProtocol] {
        let items:[StatsItemProtocol] = [
            StatsItemCompletion()]
        return items
    }
}