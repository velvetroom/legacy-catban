import Foundation
import Shared
import Repository
import Load
import Home
import Card

class Injection {
    func load() {
        Configuration.repositoryBoardType = Repository.self
        Configuration.repositoryProjectType = Repository.self
        Configuration.controllerLoadType = Load.Controller.self
        Configuration.controllerHomeType = Home.Controller.self
        Configuration.controllerCardType = Card.Controller.self
    }
}
