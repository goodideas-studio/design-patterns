package com.techapp.james.gridviewdemo

import com.androidcamp.goodideas.monsterhunter.R

/**
 * Created by James on 2018/2/26.
 */
object SingletonList : ArrayList<ShopItem>() {
    init {
        this.add(ShopItem("sword1", R.drawable.sword, 50, 30,200))
        this.add(ShopItem("sword2", R.drawable.sword1, 100, 63,300))
        this.add(ShopItem("sword3", R.drawable.sword2, 96, 63,500))
        this.add(ShopItem("sword4", R.drawable.sword3, 56, 60,700))
        this.add(ShopItem("sword5", R.drawable.sword4, 55, 96,56))
        this.add(ShopItem("sword6", R.drawable.sword5, 96, 60,1000))
        this.add(ShopItem("sword7", R.drawable.sword, 150, 56,1523))
        this.add(ShopItem("sword8", R.drawable.sword, 180, 55,1620))
        this.add(ShopItem("sword9", R.drawable.sword, 200, 60,1356))
        this.add(ShopItem("sword10", R.drawable.sword, 300, 98,1489))
    }
}