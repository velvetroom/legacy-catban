import Foundation

public extension DispatchQueue {
    class func privateBackgroundWith(identifier:String) -> DispatchQueue {
        return DispatchQueue(
            label:identifier,
            qos:DispatchQoS.background,
            attributes:DispatchQueue.Attributes.concurrent,
            autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
    }
}
