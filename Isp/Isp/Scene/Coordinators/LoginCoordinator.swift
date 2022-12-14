import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var rootViewController: UIViewController = UIViewController()
    
    func start() {
        print("Starting method")
        guard let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Unable to istantiate ViewController")
        }
        viewController.delegate = self
        self.rootViewController = viewController
    }
}

extension LoginCoordinator: FirstViewControllerDelegate {
    
    func navigateToNextPage() {
        let secondCoordinator = SecondCoordinator(rootViewController: rootViewController)
        secondCoordinator.delegate = self
        childCoordinator.append(secondCoordinator)
        secondCoordinator.start()
        
    }
}
extension LoginCoordinator: BackToFirstViewControllerDelegate {
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator) {
        rootViewController.present(rootViewController, animated: true)
        childCoordinator.removeLast()
    }
}
