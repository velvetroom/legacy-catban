import Foundation

extension String {
    private struct Constants {
        static let tableLanding:String = "LocalizableLanding"
        static let tableProject:String = "LocalizableProject"
        static let tableWriter:String = "LocalizableWriter"
    }
    
    static func localizedLanding(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableLanding, comment:String())
    }
    
    static func localizedProject(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableProject, comment:String())
    }
    
    static func localizedWriter(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableWriter, comment:String())
    }
}
