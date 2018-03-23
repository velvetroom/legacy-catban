import Foundation

extension String {
    private struct Constants {
        static let tableLanding:String = "LocalizableLanding"
    }
    
    static func localizedLanding(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableLanding, comment:String())
    }
}
