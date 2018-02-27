package com.androidcamp.goodideas.monsterhunter.PackageModel

import com.androidcamp.goodideas.monsterhunter.R

/**
 * Created by York on 2018/2/26.
 */
object Package: ArrayList<Stuff>() {
    init {
        this.add(Stuff("sword1", R.drawable.sword1, 100, 63))
        this.add(Stuff("sword2", R.drawable.sword2, 100, 63))
        this.add(Stuff("sword3", R.drawable.sword3, 96, 63))
        this.add(Stuff("sword4", R.drawable.sword4, 56, 60))
        this.add(Stuff("sword5", R.drawable.sword5, 55, 96))
    }
    override fun add(stuff: Stuff): Boolean {
        super.add(stuff)
        return true
    }
}