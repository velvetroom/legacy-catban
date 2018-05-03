import Foundation

extension HistoryItemProtocol {
    static func currentTimestamp() -> Int {
        let timestamp:TimeInterval = Date().timeIntervalSince1970
        return Int(timestamp)
    }
}
