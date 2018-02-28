package com.androidcamp.goodideas.monsterhunter.model.pack

import com.androidcamp.goodideas.monsterhunter.R

/**
 * Created by York on 2018/2/26.
 */
object Package: ArrayList<Stuff>() {
    init {
        this.add(Stuff("Blue Water", R.drawable.blue_water, 0, 63))
        this.add(Stuff("Red Water", R.drawable.red_water, 100, 0))
        this.add(Stuff("Blue Water", R.drawable.blue_water, 0, 63))
        this.add(Stuff("Red Water", R.drawable.red_water, 56, 0))
        this.add(Stuff("Blue Water", R.drawable.blue_water, 0, 96))
    }

}