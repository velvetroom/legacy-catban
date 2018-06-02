import Foundation

public extension Date {
    public static var timestamp:Int {
        get {
            return Int(Date().timeIntervalSince1970)
        }
    }
}
