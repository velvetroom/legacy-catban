import Foundation

extension String {
    private struct Constants {
        static let tableLanding:String = "LocalizableLanding"
        static let tableProject:String = "LocalizableProject"
    }
    
    static func localizedLanding(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableLanding, comment:String())
    }
    
    static func localizaedProject(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableProject, comment:String())
    }
}
