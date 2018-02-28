package com.androidcamp.goodideas.monsterhunter.presenter.pack

import com.androidcamp.goodideas.monsterhunter.CompressModel.BitmapCompress
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.R
import com.androidcamp.goodideas.monsterhunter.model.pack.Package
import com.androidcamp.goodideas.monsterhunter.view.pack.PackFragment
import com.androidcamp.goodideas.monsterhunter.view.pack.PackView

/**
 * Created by York on 2018/2/28.
 */
class PackPresenter(val packView: PackView) {

    fun retrievePackage() {
        packView.initGridView()
    }

    fun showStuffCount() {
        packView.setStuffCount(Package.size)
    }

    fun setBagImage() {
        val bitmap = BitmapCompress.compressBySize((packView as PackFragment).resources, R.drawable.bag, 30, 30)
        packView.setBagImage(bitmap)
    }

    fun enhanceStatus(index: Int) {
        Status.hp = Status.hp + Package[index].hp
        Status.mp = Status.mp + Package[index].mp
    }
}