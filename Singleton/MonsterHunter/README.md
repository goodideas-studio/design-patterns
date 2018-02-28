# Monster Hunter
![image](https://github.com/goodideas-studio/design-patterns/blob/master/Singleton/MonsterHunter/gif_20180228_132916.gif)

此App使用到Singleton的地方在於Status class(角色狀態)、Package class(背包)、SingletonList class(商品)。只要宣告類別為object就有如同Java static class的作用。

```
object Package: ArrayList<Stuff>() {
    init {
        this.add(Stuff("Blue Water", R.drawable.blue_water, 0, 63))
        this.add(Stuff("Red Water", R.drawable.red_water, 100, 0))
        this.add(Stuff("Blue Water", R.drawable.blue_water, 0, 63))
        this.add(Stuff("Red Water", R.drawable.red_water, 56, 0))
        this.add(Stuff("Blue Water", R.drawable.blue_water, 0, 96))
    }

}
```

## MainFragment 
主畫面為與怪物戰鬥，上方顯示的資訊為金錢、角色的HP、MP和攻擊、防禦力，點擊右下角的武器圖案便會攻擊怪物。
每攻擊一次就會加200金幣。

## PackFragment
第二個畫面為角色背包，可以使用紅色藥水或藍色藥水恢復生命值及魔力。

## ShopFragment
第三個畫面為道具商店，只要點選任意圖示便可消耗金幣購買該商品，買完的同時Package Singleton便會同時新增一筆資料。切回PackFragment時便能看到背包出現新的商品。
