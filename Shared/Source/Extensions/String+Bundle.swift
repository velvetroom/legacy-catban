import Foundation

public extension String {
    public static func localized(key:String, in type:AnyClass) -> String {
        let bundle:Bundle = Bundle(for:type)
        return NSLocalizedString(key, tableName:nil, bundle:bundle, comment:String())
    }
}
