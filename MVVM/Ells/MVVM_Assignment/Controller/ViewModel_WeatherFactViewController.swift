
import SwiftyJSON
import Alamofire

func getWeather(url: String) {
  
  Alamofire.request(darkSkyAPIKey, method: .get).responseJSON { (response) in
    
    if response.result.isSuccess  {
      let weatherData: JSON = JSON(response.result.value)
      
      print(weatherData)
    } else if response.error != nil {
      print(response.result.error)
    }
  }
}

