import Foundation

open class ViewModel {
    private var properties:[ObjectIdentifier:ViewModelPropertyProtocol]
    
    public init() {
        self.properties = [:]
        self.update(property:ViewModelNavigation())
    }
    
    open func update<ViewModelProperty:ViewModelPropertyProtocol>(property:ViewModelProperty) {
        let property:ViewModelProperty = self.observedProperty(property:property)
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:property))
        self.properties[identifier] = property
        property.notifyObserver()
    }
    
    open func property<ViewModelProperty:ViewModelPropertyProtocol>() -> ViewModelProperty? {
        let identifier:ObjectIdentifier = ObjectIdentifier(ViewModelProperty.self)
        return self.properties[identifier] as? ViewModelProperty
    }
    
    private func observedProperty<ViewModelProperty:ViewModelPropertyProtocol>(
        property:ViewModelProperty) -> ViewModelProperty {
        var property:ViewModelProperty = property
        if let previousProperty:ViewModelProperty = self.property() {
            property.observer = previousProperty.observer
        }
        return property
    }
}
