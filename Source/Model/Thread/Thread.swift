import Foundation

class Thread {
    class func factoryBackgroundConcurrentWith(label:String) -> DispatchQueue {
        return DispatchQueue(
            label:label,
            qos:DispatchQoS.background,
            attributes:DispatchQueue.Attributes.concurrent,
            autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
    }
}
