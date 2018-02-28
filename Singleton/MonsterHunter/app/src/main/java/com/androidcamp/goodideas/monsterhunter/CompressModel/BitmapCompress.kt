package com.androidcamp.goodideas.monsterhunter.CompressModel

import android.content.res.Resources
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log

/**
 * Created by York on 2018/2/27.
 */
class BitmapCompress {
    fun compressBySize(resource: Resources, resourceId: Int, requestWidth: Int, requestHeight: Int): Bitmap {
        val options = BitmapFactory.Options()
        options.inJustDecodeBounds = true
        BitmapFactory.decodeResource(resource, resourceId, options)

        // 計算取樣率
        options.inSampleSize = calculateFitSize(requestWidth, requestHeight, options)
//        options.inSampleSize = 6
        options.inJustDecodeBounds = false
        return BitmapFactory.decodeResource(resource, resourceId, options)
    }

    private fun calculateFitSize(reqWidth: Int, reqHeight: Int, options: BitmapFactory.Options): Int {

        // 原始圖片的寬高
        val height = options.outHeight
        val width = options.outWidth
        var inSampleSize = 1
        if (height > reqHeight || width > reqWidth) {
            val halfHeight = height / 2
            val halfWidth = width / 2
            // 在保證解析出的bitmap寬高分別大於目標尺寸寬高的前提下，取可能的inSampleSize的最大值
            while (halfHeight / inSampleSize >= reqHeight && halfWidth / inSampleSize >= reqWidth) {
                inSampleSize *= 2
            }
        }
        Log.d("calculateFitSize", "imSampleSize: ${inSampleSize}")
        return inSampleSize
    }

}