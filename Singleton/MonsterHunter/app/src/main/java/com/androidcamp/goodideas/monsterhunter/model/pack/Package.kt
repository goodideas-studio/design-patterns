package com.androidcamp.goodideas.monsterhunter.model.pack

import com.androidcamp.goodideas.monsterhunter.R

/**
 * Created by York on 2018/2/26.
 */
public object Package: ArrayList<Stuff>() {
    init {
        this.add(Stuff("魔力藥水", R.drawable.blue_water, 0, 63))
        this.add(Stuff("生命藥水", R.drawable.red_water, 100, 0))
        this.add(Stuff("魔力藥水", R.drawable.blue_water, 0, 63))
        this.add(Stuff("生命藥水", R.drawable.red_water, 56, 0))
        this.add(Stuff("魔力藥水", R.drawable.blue_water, 0, 96))
    }

}