package com.androidcamp.goodideas.monsterhunter.view.pack

import android.graphics.Bitmap

/**
 * Created by York on 2018/2/28.
 */
interface PackView {
    fun setStuffCount(stuffCount: Int)
    fun setBagImage(bitmap: Bitmap)
    fun initGridView()
}