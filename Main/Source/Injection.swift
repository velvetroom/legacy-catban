import Foundation
import Shared
import Repository
import Canvas
import Load
import Home
import Card
import Column
import Projects

class Injection {
    func load() {
        Configuration.repositoryBoardType = Repository.self
        Configuration.repositoryProjectType = Repository.self
        Configuration.controllerLoadType = Load.Controller.self
        Configuration.controllerHomeType = Home.Controller.self
        Configuration.controllerCardType = Card.Controller.self
        Configuration.controllerColumnType = Column.Controller.self
        Configuration.controllerProjectsType = Projects.Controller.self
        Configuration.canvasType = Canvas.self
    }
}
