
import UIKit

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let settingVC = segue.destination as? SettingColorViewController else { return }
        settingVC.delegate = self
        settingVC.color = view.backgroundColor
        
    }
    
}

extension StartingViewController: SettingColorViewControllerDelegate {
    func setupColorForBackground(_ color: UIColor) {
        view.backgroundColor = color
    }
    


    
}
