package com.androidcamp.goodideas.monsterhunter.PackageModel

/**
 * Created by York on 2018/2/26.
 */
object Package: ArrayList<Stuff>() {
    init {
        this.add(Stuff("sword1", 20, 30))
        this.add(Stuff("sword2", 50, 10))
        this.add(Stuff("sword3", 50, 60))
        this.add(Stuff("sword4", 50, 60))
        this.add(Stuff("sword5", 50, 60))
        this.add(Stuff("sword6", 50, 60))
        this.add(Stuff("sword7", 50, 60))
        this.add(Stuff("sword8", 50, 60))
    }
}