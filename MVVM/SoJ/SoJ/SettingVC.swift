import UIKit

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let timeSettingTitle = [ "12 Hour", "24 Hour"]
    var timeSettingDidMark = [true, false]
    
    let lengthSettingTitle = ["Imperial", "Metric"]
    var lengthSettingDidMark =  [true, false]
    
    let tempSettingTitle = ["Fahrenheit", "Celcius"]
    var tempSettingDidMark = [true, false]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 242/255, alpha: 1)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return timeSettingTitle.count
        case 1:
            return lengthSettingTitle.count
        case 2:
            return tempSettingTitle.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = timeSettingTitle[indexPath.row]
            if timeSettingDidMark[indexPath.row] {
                cell?.accessoryType = .checkmark
            }
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = lengthSettingTitle[indexPath.row]
            if lengthSettingDidMark[indexPath.row] {
                cell?.accessoryType = .checkmark
            }
            return cell!
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = tempSettingTitle[indexPath.row]
            if tempSettingDidMark[indexPath.row] {
                cell?.accessoryType = .checkmark
            }
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if timeSettingDidMark[indexPath.row] {
                return
            } else {
                for i in 0..<timeSettingDidMark.count {
                    let cell = tableView.cellForRow(at: [indexPath.section, i])
                    timeSettingDidMark[i] = !timeSettingDidMark[i]
                
                    let mark: UITableViewCellAccessoryType = timeSettingDidMark[i] ? .checkmark : .none
                    cell?.accessoryType = mark
                }
            }
            
        case 1:
            if lengthSettingDidMark[indexPath.row] {
                return
            } else {
                for i in 0..<lengthSettingDidMark.count {
                    let cell = tableView.cellForRow(at: [indexPath.section, i])
                    lengthSettingDidMark[i] = !lengthSettingDidMark[i]
                    let mark: UITableViewCellAccessoryType = lengthSettingDidMark[i] ? .checkmark : .none
                    cell?.accessoryType = mark
                }
            }
        case 2:
            if tempSettingDidMark[indexPath.row] {
                return
            } else {
                for i in 0..<tempSettingDidMark.count {
                    let cell = tableView.cellForRow(at: [indexPath.section, i])
                    tempSettingDidMark[i] = !tempSettingDidMark[i]
                    let mark: UITableViewCellAccessoryType = tempSettingDidMark[i] ? .checkmark : .none
                    cell?.accessoryType = mark
                }
            }
        default:
            break
        }
    }

}
