import UIKit

public protocol SecondViewControllerDelegate: AnyObject {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class MovementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public weak var delegate: SecondViewControllerDelegate?

    var delegateTwo: SendDataTapButtonDelegate?
    var savedData: String = ""
    var cellType: String = ""
    var importo: String = ""
    var nome: String = ""
    
    //MARK: - Outlets
    @IBOutlet weak var customerUiView: UIView!
    @IBOutlet weak var circularImageView: UIImageView!
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func didTapPlusButton(_ sender: UIBarButtonItem) {
        self.delegate?.navigateToThirdPage()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let addMovementViewController = storyboard.instantiateViewController(withIdentifier: "AddMovementViewController") as? AddMovementViewController {
//            self.present(addMovementViewController, animated: true)
//            addMovementViewController.delegateTwo = self
//        }
        
        }
    
    //MARK: - Properties
    var allData : AllData?
    var cards: [Card] = []
    var colors: [Color] = []
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        parseJson()
        if let allData = allData {
            allData.listaCarte.forEach { carta in
                if let card = Card.init(rawValue: carta.nome) {
                    cards.append(card)
                }
            }
        }
        
        //MARK: - UIView
        customerUiView.layer.cornerRadius = 10
        customerUiView.layer.shadowRadius = 3
        customerUiView.layer.shadowOpacity = 0.5
        customerUiView.layer.shadowOffset = CGSize(width: 3, height: 3)

        //MARK: - ImageView
        circularImageView.layer.cornerRadius = circularImageView.frame.size.width/2
        
        //MARK: - Labels
        nameLabel.text = allData?.infoPrincipali.nome
        saldoLabel.text = "Saldo: " + String(allData!.infoPrincipali.saldo) + " €"
        
        //MARK: - CollectionView
        cardCollectionView.register(UINib.init(nibName: CardsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CardsCollectionViewCell.identifier)
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        
        //MARK: - TableView
        tableView.delegate = self
        tableView.dataSource = self
    }
        
//       navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",style:.plain, target: self, action: #selector(dismissSelf))
    
    //MARK: - Private Methods
    private func parseJson() {
        guard let path = Bundle.main.path(forResource: "esercizio", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
            allData = try JSONDecoder().decode(AllData.self, from: jsonData)
            return
        } catch {
            print(error)
        }
    }
    
    //MARK: - TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData!.listaMovimenti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.nomeLabel.text = allData?.listaMovimenti[indexPath.row].nome.capitalized
        cell.descrizioneLabel.text = allData?.listaMovimenti[indexPath.row].descrizione?.capitalized
        cell.importoLabel.text = String(allData!.listaMovimenti[indexPath.row].importo)
        if (allData?.listaMovimenti[indexPath.row].importo)! > 0 {
            cell.importoLabel.textColor = UIColor.green
        } else if (allData?.listaMovimenti[indexPath.row].importo)! < 0 {
            cell.importoLabel.textColor = UIColor.red
        } else {
            cell.importoLabel.textColor = UIColor.black
        }
        return cell
    }
    
}

//MARK: - UICollectionViewDataSource
extension MovementViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allData?.listaCarte.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as? CardsCollectionViewCell {
            cell.configure(cards: cards[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

//MARK: - UICollectionViewDelegate
extension MovementViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MovementViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 100)
        
    }
}

extension MovementViewController: SendDataTapButtonDelegate {
    func didTapButton(importo: String, nome: String) {
        self.importo = importo
        self.nome = nome
        if let importoDouble = Double(importo) {
        allData?.listaMovimenti.append(ListaMovimenti(importo: importoDouble, descrizione: nil, nome: nome))
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            tableView.endUpdates()
//        print("££££££££££££££££££££", importo,nome)
//            print(allData?.listaMovimenti)
    }
    }
}

