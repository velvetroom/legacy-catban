import Foundation

public struct Configuration {
    public static var repositoryBoardType:RepositoryBoardProtocol.Type!
    public static var repositoryProjectType:RepositoryProjectProtocol.Type!
    public static var controllerLoadType:ControllerProtocol.Type!
    public static var controllerHomeType:ControllerProjectProtocol.Type!
    public static var controllerCardType:ControllerCardProtocol.Type!
    public static var canvasType:CanvasProtocol.Type!
}
