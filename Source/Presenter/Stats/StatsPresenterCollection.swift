import Foundation

struct StatsPresenterCollection {
    var delegate:StatsPresenterCollectionDelegateProtocol
    var datasource:StatsPresenterCollectionDatasourceProtocol
    
    init() {
        self.delegate = StatsPresenterCollectionDelegate()
        self.datasource = StatsPresenterCollectionDatasource()
    }
}
