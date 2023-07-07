import UIKit

// @:?!()$#,./\

// 스위프트 안에서는 백슬래시 벗어나려면 백슬래시 하나 더 추가
let text = "\\"

// Regex에서는 백슬래시 벗어나려면 백슬래시 두개 추가
let specialCharacterRegex = "[@:?!()$#,./\\\\]+"
text.range(of: specialCharacterRegex, options: .regularExpression) != nil
