import UIKit

protocol SendDataTapButtonDelegate {
    func didTapButton (importo: String, nome: String)
}

class AddMovementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public weak var delegateNav: SecondViewControllerDelegate?
    var delegate: MovementDataProtocol?
    var delegateTwo: SendDataTapButtonDelegate?
    var receivedData: String?
    var receivedType: String?
    var nome: String = ""
    var importo: String = ""
    
    @IBOutlet weak var addMovementTableView: UITableView!
    
    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        if !nome.isEmpty, !importo.isEmpty {
            self.delegateTwo?.didTapButton(importo: importo, nome: nome)
            print(importo, nome)
        }
        self.dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addMovementTableView.separatorStyle = .none
        addMovementTableView.register(AddMovementTableViewCell.Nib(), forCellReuseIdentifier: AddMovementTableViewCell.identifier)
        self.addMovementTableView.dataSource = self
        self.addMovementTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addMovementTableView.dequeueReusableCell(withIdentifier: AddMovementTableViewCell.identifier, for: indexPath) as! AddMovementTableViewCell
        cell.delegate = self
        if indexPath.row == 0 {
            cell.cellType = "Importo"
        cell.importoLabel.text = "Importo"
        cell.currencyLabel.text = "€"
        return cell
        }
        if indexPath.row == 1 {
            cell.cellType = "Nome"
        cell.importoLabel.text = "Nome"
        cell.currencyLabel.text = .none
        return cell
    }
        return cell
    }
}

extension AddMovementViewController: MovementDataProtocol {
    
    func sendMovementData(movementData: String, cellType: String) {
        if cellType == "Nome" {
             nome = movementData
//            print(nome)
        }
        else if cellType == "Importo"
        {
            importo = movementData
//            print(importo)
        }

    }
}

