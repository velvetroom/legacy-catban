import Foundation

extension String {
    static func localized(key:String) -> String {
        let bundle:Bundle = Bundle(for:Board.self)
        return NSLocalizedString(key, tableName:nil, bundle:bundle, comment:String())
    }
}
