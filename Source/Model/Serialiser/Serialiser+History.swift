import Foundation

extension Serialiser {
    func historyArrayWith(project:ProjectProtocol) -> [Any] {
        var array:[Any] = []
        for item:HistoryItemProtocol in project.history.items {
            let serialised:[String:Any] = SerialiserHistory.serialise(item:item)
            array.append(serialised)
        }
        return array
    }
}
