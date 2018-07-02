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
    
    private func started(synched:ProjectSynchedProtocol, onCompletion:@escaping(() -> Void)) {
        self.board.remove(project:self.project)
        self.board.add(project:synched)
        self.project = synched
        DispatchQueue.main.async {
            onCompletion()
        }
    }
    
    private func found(error:Error, onError:@escaping((Error) -> Void)) {
        DispatchQueue.main.async {
            onError(error)
        }
    }
}
