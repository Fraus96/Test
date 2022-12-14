import UIKit

class TableViewCell: UITableViewCell {

    var delegate: MovementDataProtocol?
    
    @IBOutlet weak var importoLabel : UILabel!
    @IBOutlet weak var descrizioneLabel : UILabel!
    @IBOutlet weak var nomeLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
