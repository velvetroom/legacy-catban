import Foundation

public struct Configuration {
    public static var repositoryBoardType:RepositoryBoardProtocol.Type!
    public static var repositoryProjectType:RepositoryProjectProtocol.Type!
    public static var navigationType:NavigationProtocol.Type!
    public static var controllerLoadType:ControllerProtocol.Type!
}
