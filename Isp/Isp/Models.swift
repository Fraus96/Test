import Foundation
import UIKit

struct AllData: Codable {
    let infoPrincipali: InfoPrincipali
    let listaCarte: [ListaCarte]
    var listaMovimenti: [ListaMovimenti]
}

// MARK: - InfoPrincipali
struct InfoPrincipali: Codable {
    let nome, cognome: String
    let saldo: Double
}

// MARK: - ListaCarte
struct ListaCarte: Codable {
    let nome, colore: String
}

// MARK: - ListaMovimenti
struct ListaMovimenti: Codable {
    let importo: Double
    let descrizione: String?
    let nome: String
}

// MARK: - CardsName
enum Card: String, CaseIterable, Codable {
    
    case visa = "VISA"
    case mastercard = "MASTERCARD"
    case postepay = "POSTEPAY"
    case maestro = "MAESTRO"

    func cardsColor() -> UIColor {
        switch self {
        case .visa : return UIColor.blue
        case .mastercard : return UIColor.red
        case .postepay : return UIColor.yellow
        case .maestro : return UIColor.green
        }
    }
}
enum Color: String, CaseIterable, Codable {
    
    case rosso = "rosso"
    case blu = "blu"
    case giallo = "giallo"
    case verde = "verde"
    
    
    var cardColor : UIColor {
        
        switch self {
            
        case .rosso : return UIColor.red
        case .blu : return UIColor.blue
        case .giallo : return UIColor.yellow
        case .verde : return UIColor.green
        }
    }
}





    
