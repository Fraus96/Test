import UIKit

protocol MovementDataProtocol {
    func sendMovementData(movementData: String, cellType: String)
}

class AddMovementTableViewCell: UITableViewCell {
    
    var delegate: MovementDataProtocol?
    var cellType: String = ""
    static let identifier = "AddMovementCell"
//    var importo = ""
    static func Nib() -> UINib {
        
        return UINib(nibName: "AddMovementTableViewCell", bundle: nil)
    }
    
    @IBAction func deleteMovement(_ sender: UIBarButtonItem) {
    }
    @IBOutlet weak var importoLabel: UILabel!

    @IBOutlet weak var importoTextField: UITextField!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBAction func importoEndEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
        if let text = importoTextField.text {
            self.delegate?.sendMovementData(movementData: text, cellType: cellType)
//            print("--------________--------_______------______", cellType, text)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        importoLabel.text = "Importo"
        currencyLabel.text = "€"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
