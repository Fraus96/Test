import UIKit

protocol FirstViewControllerDelegate: AnyObject {

    func navigateToNextPage()
}

class ViewController: UIViewController {
    
    public weak var delegate : FirstViewControllerDelegate?
    
    var saveUsername = ""
    var savePassword = ""
    
    
    @IBOutlet var field : UITextField!
    @IBOutlet var button : UIButton!
    @IBOutlet var password : UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)  
        field.returnKeyType = .done
        field.autocapitalizationType = .words
        field.autocorrectionType = .no
        field.becomeFirstResponder()
        self.field.text = "username"
        self.password.text = "password"        
    }
    @IBAction func usernameEndEditing(_ sender: UITextField) {
        _ = sender.text
    }
    
    @IBAction func passwordEndEditing(_ sender: UITextField) {
        _ = sender.text
    }
    
    @IBAction func tapButton() {
                
        field.resignFirstResponder()
        password.resignFirstResponder()
        if !field.text!.isEmpty && !password.text!.isEmpty {
            self.delegate?.navigateToNextPage()

//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            if let movementViewController = storyboard.instantiateViewController(withIdentifier: "MovementViewController") as? MovementViewController {
//                let navVc = UINavigationController(rootViewController: movementViewController)
//                navVc.modalPresentationStyle = .fullScreen
//                present(navVc, animated: true)
//            }
        }
    }
}
