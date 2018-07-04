import Foundation
import CleanArchitecture
import Architecture
import Board
import Shared

public class Interactor:InteractorProjectProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public weak var project:ProjectProtocol!
    public var board:BoardProtocol!
    public var repository:RepositoryProjectProtocol
    
    public required init() {
        self.repository = Configuration.repositoryProjectType.init()
    }
    
    func start(onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        self.repository.startRemote(project:self.project,
                                    onCompletion: { [weak self] (synched:ProjectSynchedProtocol) in
            self?.started(synched:synched, onCompletion:onCompletion)
        }, onError: { [weak self] (error:Error) in
            self?.found(error:error, onError:onError)
        })
    }
    
    func save(onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
//        let project:ProjectSynchedProtocol = self.project as! ProjectSynchedProtocol
//        self.repository.remoteSave(project:project,
//                                   onCompletion: { [weak self] in
//                                    self?.remoteSaved(project:project, onCompletion:onCompletion)
//            }, onError: { [weak self] (error:Error) in
//                self?.found(error:error, onError:onError)
//        })
    }
    
    private func started(synched:ProjectSynchedProtocol, onCompletion:@escaping(() -> Void)) {
        self.replaceProject(synched:synched)
        self.remoteSaved(project:synched, onCompletion:onCompletion)
    }
    
    private func replaceProject(synched:ProjectSynchedProtocol) {
        self.board.remove(project:self.project)
        self.board.add(project:synched)
        self.project = synched
    }
    
    private func found(error:Error, onError:@escaping((Error) -> Void)) {
        DispatchQueue.main.async {
            onError(error)
        }
    }
    
    private func remoteSaved(project:ProjectSynchedProtocol, onCompletion:@escaping(() -> Void)) {
        self.repository.localSave(project:project)
        DispatchQueue.main.async {
            onCompletion()
        }
    }
}
