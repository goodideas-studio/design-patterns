import UIKit

//struct JasonData {
//    let current = [String: Any]
//}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var weekTableView: UITableView!
    
    var dailyDetailData = [DailyDetailData]()
    var tempSetting = [Bool]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyDetailData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! DailyCell

        let time = Date(timeIntervalSince1970: dailyDetailData[indexPath.row].time)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDate = dateFormatter.string(from: time)

        dateFormatter.dateFormat = "DD, MMMM"
        let dayDate = dateFormatter.string(from: time)

        cell.weekDateLabel.text = weekDate
        cell.dateLabel.text = dayDate
        
        

        
        
        if tempSetting[0] {
            cell.tempLabel.text = "\(Int(dailyDetailData[indexPath.row].temperatureLow)) °F - \(Int(dailyDetailData[indexPath.row].temperatureHigh)) °F"
        } else {
            cell.tempLabel.text = "\(Int(((dailyDetailData[indexPath.row].temperatureLow)-32) * 5/9)) ºC - \(Int(((dailyDetailData[indexPath.row].temperatureLow)-32) * 5/9)) ºC"
        }

            cell.windLabel.text = "\(Int(dailyDetailData[indexPath.row].windSpeed)) KPH"
        
            cell.iconImageView.image = UIImage(named: dailyDetailData[indexPath.row].icon)

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tempSetting = UserDefaults.standard.object(forKey: "tempSetting") as? [Bool] ?? [true, false]
        
        let jasonUrlString = "https://api.darksky.net/forecast/404afa40dd2a00825f7d74e65549cafc/23.02,120.223"
        guard let url = URL(string: jasonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }else{
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let okData = try jsonDecoder.decode(AllData.self, from: data)
                        self.dailyDetailData = okData.daily.data
                        DispatchQueue.main.async {
                            self.weekTableView.reloadData()
                        }
                    } catch {
                        print(error)
                        return
                    }
                }
            }
            }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
