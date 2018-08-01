import Foundation

class Library:LibraryProtocol {
    var session:SessionProtocol
    var boards:[BoardProtocol]
    var repository:RepositoryProtocol
    
    init() {
        self.session = SessionNil()
        self.boards = []
        self.repository = Configuration.repositoryType.init()
    }
    
    func loadSession(completion:@escaping(() -> Void)) {
        self.repository.load(session: { [weak self] (session:Configuration.SessionType) in
            self?.loaded(session:session, completion:completion)
        }, error: { [weak self] (_:Error) in
            self?.loadSessionFailed(completion:completion)
        })
    }
    
    func loadBoards(completion:@escaping(() -> Void), error:@escaping((Error) -> Void)) {
        
    }
    
    private func loaded(session:SessionProtocol, completion:(() -> Void)) {
        self.session = session
        completion()
    }
    
    private func loadSessionFailed(completion:(() -> Void)) {
        let session:Configuration.SessionType = Configuration.SessionType()
        self.session = session
        self.repository.save(session:session)
        completion()
    }
}
