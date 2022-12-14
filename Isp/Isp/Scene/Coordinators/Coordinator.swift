import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinator : [Coordinator] {get set}
    var rootViewController : UIViewController {get set}
    func start()
}

