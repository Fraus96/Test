import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: LoginCoordinator!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Launch")
           // Configure Window
           // Make Key and Visible
        
        coordinator = LoginCoordinator()
        coordinator?.start()
        window?.rootViewController = coordinator?.rootViewController
        window?.makeKeyAndVisible()


        return true
    }
}
