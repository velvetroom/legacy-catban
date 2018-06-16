import Foundation

open class ViewModel {
    private var properties:[ObjectIdentifier:ViewModelPropertyProtocol]
    
    public init() {
        self.properties = [:]
    }
    
    open func update(property:ViewModelPropertyProtocol) {
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:property))
        self.properties[identifier] = property
        property.notifyObserver()
    }
    
    open func property<ViewModelProperty:ViewModelPropertyProtocol>() -> ViewModelProperty? {
        let identifier:ObjectIdentifier = ObjectIdentifier(ViewModelProperty.self)
        return self.properties[identifier] as? ViewModelProperty
    }
}
