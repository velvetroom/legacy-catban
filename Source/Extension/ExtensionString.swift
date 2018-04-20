import Foundation

extension String {
    private struct Constants {
        static let tableLoad:String = "LocalizableLoad"
        static let tableLanding:String = "LocalizableLanding"
        static let tableProject:String = "LocalizableProject"
        static let tableWriter:String = "LocalizableWriter"
        static let tableOrganise:String = "LocalizableOrganise"
        static let tableError:String = "LocalizableError"
    }
    
    static func localizedLoad(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableLoad, comment:String())
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
    
    static func localizedOrganise(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableOrganise, comment:String())
    }
    
    static func localizedError(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableError, comment:String())
    }
}
