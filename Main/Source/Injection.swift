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
        Configuration.viewLoadType = Load.View.self
        Configuration.viewHomeType = Home.View.self
        Configuration.viewCardType = Card.View.self
        Configuration.viewColumnType = Column.View.self
        Configuration.viewProjectsType = Projects.View.self
        Configuration.canvasType = Canvas.self
        Configuration.directoryRoot = RepositoryConstants.Url.directoryRoot
    }
}
