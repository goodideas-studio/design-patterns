今天我們想要用 EthanColor 來實做一個調色盤，大概的概念會是「任意顏色都可以互相混合」，舉例來說，如果我需要紫色，我可以透過下列方法得到：

let blue = EthanColor.blue
let red = EthanColor.red

let purple = blue.decorate(red)

如果需要半透明的紅色則可以透過下列方式

let red = EthanColor.red
let alpha = EthanColor.alpha(0.5)
let 半透明紅色 = alpha.decorate(red)

你不一定要用 Decorator，請在心中想像 iOS UIColor，然後想辦法實作出 EthanColor。

請一定要符合以下條件：

1. 隨便幾個 EthanColor 都可以互相混合

以上只是舉例（程式碼如有錯誤不代表本台立場），請以這個概念，實作你心中的調色盤。

此題目感謝Hugh友情贊助idea。