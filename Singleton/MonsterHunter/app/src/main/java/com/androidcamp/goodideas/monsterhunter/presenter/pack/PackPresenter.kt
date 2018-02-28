package com.androidcamp.goodideas.monsterhunter.presenter.pack

import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.model.pack.Package
import com.androidcamp.goodideas.monsterhunter.view.pack.PackView

/**
 * Created by York on 2018/2/28.
 */
class PackPresenter(val packView: PackView) {

    fun retrievePackage() {
        packView.initGridView()
    }

    fun showStuffCount() {
        packView.setStuffCount()
    }

    fun enhanceStatus(index: Int) {
        Status.hp = Status.hp + Package[index].hp
        Status.mp = Status.mp + Package[index].mp
    }
}