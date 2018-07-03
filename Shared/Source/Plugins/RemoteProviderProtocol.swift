import Foundation

public protocol RemoteProviderProtocol {
    init()
    
    func save(data:Data, identifier:String,
              onCompletion:@escaping(() -> ()),
              onError:@escaping((Error) -> Void))
    func load(identifier:String,
              onCompletion:@escaping((Data?) -> ()),
              onError:@escaping((Error) -> Void))
}
