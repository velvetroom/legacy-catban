import Foundation

extension String {
    private static var bundle:Bundle {
        get {
            return Bundle(for:Board.self)
        }
    }
    
    static func localized(key:String) -> String {
        return NSLocalizedString(key, tableName:nil, bundle:bundle, comment:String())
    }
}
