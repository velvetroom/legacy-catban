import Foundation
import Shared

class Remote:RemoteProtocol {
    func makeIdentifier(onCompletion:@escaping((String) -> Void), onError:@escaping((Error) -> Void)) {
        onCompletion(UUID().uuidString)
    }
    
    func save(data:Data, identifier:String, onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        DispatchQueue.main.async { [weak self] in
            self?.mainThreadSave(data:data, identifier:identifier, onCompletion:onCompletion, onError:onError)
        }
    }
    
    func load(hash:String, onCompletion:@escaping((Data) -> Void), onError:@escaping((Error) -> Void)) {
        
    }
    
    private func mainThreadSave(data:Data, identifier:String,
                                onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        if let providerType:RemoteProviderProtocol.Type = Configuration.remoteProviderType {
            let provider:RemoteProviderProtocol = providerType.init()
            self.saveWith(provider:provider, data:data, identifier:identifier,
                          onCompletion:onCompletion, onError:onError)
        } else {
            onError(ErrorRepository.noRemoteProvider)
        }
    }
    
    private func saveWith(provider:RemoteProviderProtocol, data:Data, identifier:String,
                          onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        provider.save(data:data, identifier:identifier, onCompletion:onCompletion, onError:onError)
    }
}
