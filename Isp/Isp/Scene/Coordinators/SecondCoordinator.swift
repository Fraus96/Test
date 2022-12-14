import Foundation
import UIKit

protocol BackToFirstViewControllerDelegate: AnyObject {
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator)

}

class SecondCoordinator: Coordinator {

    var childCoordinator: [Coordinator] = []
    var rootViewController: UIViewController
//    var secondRootViewController = UIViewController()
    var navigationController = UINavigationController()
    weak var delegate: BackToFirstViewControllerDelegate?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController

    }

    func start() {
        
        guard let movementViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "MovementViewController") as? MovementViewController else {
            fatalError("Unable to istantiate ViewController")
        }
        
        let navigationController = UINavigationController(rootViewController: movementViewController)
        movementViewController.delegate = self
        self.rootViewController.present(navigationController, animated: true)
    }
}

extension SecondCoordinator : SecondViewControllerDelegate {

    // Navigate to third page
    func navigateToThirdPage() {
        guard let addMovementViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "AddMovementViewController") as? AddMovementViewController else {
            fatalError("")
        }
        addMovementViewController.delegateNav = self
        self.rootViewController.present(addMovementViewController, animated: true)
        
//        self.secondRootViewController = addMovementViewController
//        self.secondRootViewController.present(addMovementViewController, animated: true)
    }

    // Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}
