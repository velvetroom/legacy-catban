import Foundation

public struct Configuration {
    public static var repositoryType:RepositoryProtocol.Type!
    public static var navigationType:NavigationProtocol.Type!
    public static var controllerLoadType:ControllerProtocol.Type!
}
