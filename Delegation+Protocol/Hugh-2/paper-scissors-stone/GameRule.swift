import Foundation

enum ActionResult {
  case Tie, ActorWin, ActorLose
}

protocol GameRule {
  static func execute(actorAction: Action, targetAction: Action) -> ActionResult
}

class PSS: GameRule {
  static let rules: [String: ActionResult] = [
    "\(String(describing: Paper.self))_\(String(describing: Stone.self))": ActionResult.ActorLose,
    "\(String(describing: Paper.self))_\(String(describing: Scissors.self))": ActionResult.ActorWin,
    "\(String(describing: Stone.self))_\(String(describing: Paper.self))": ActionResult.ActorWin,
    "\(String(describing: Stone.self))_\(String(describing: Scissors.self))": ActionResult.ActorLose,
    "\(String(describing: Scissors.self))_\(String(describing: Paper.self))": ActionResult.ActorLose,
    "\(String(describing: Scissors.self))_\(String(describing: Stone.self))": ActionResult.ActorWin
  ]

  static func execute(actorAction: Action, targetAction: Action) -> ActionResult {
    if let result = rules["\(String(describing: actorAction).components(separatedBy: ".").last!)_\(String(describing: targetAction).components(separatedBy: ".").last!)"] {
      return result
    }

    return .Tie
  }
}
