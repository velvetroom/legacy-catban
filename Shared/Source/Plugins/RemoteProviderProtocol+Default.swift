import Foundation

public extension RemoteProviderProtocol {
    func save(data:Data, with identifier:String,
              onCompletion:@escaping(() -> ()),
              onError:@escaping((Error) -> Void)) { }
    func load(identifier:String,
              onCompletion:@escaping((Data) -> ()),
              onError:@escaping((Error) -> Void)) { }
}
