import Foundation
import Shared
import Repository
import Load

class Injection {
    func load() {
        Configuration.repositoryBoardType = Repository.self
        Configuration.repositoryProjectType = Repository.self
        Configuration.navigationType = Navigation.self
        Configuration.controllerLoadType = Load.Controller.self
    }
}
