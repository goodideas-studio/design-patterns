package com.androidcamp.goodideas.monsterhunter.view.pack

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import com.androidcamp.goodideas.monsterhunter.CompressModel.BitmapCompress
import com.androidcamp.goodideas.monsterhunter.model.pack.Stuff
import com.androidcamp.goodideas.monsterhunter.R
import org.jetbrains.anko.doAsync
import org.jetbrains.anko.runOnUiThread

/**
 * Created by York on 2018/2/26.
 */
class StuffAdapter(val context: Context, val stuffs: List<Stuff>): BaseAdapter() {

    override fun getView(position: Int, p1: View?, p2: ViewGroup?): View {
        var stuffView = LayoutInflater.from(context).inflate(R.layout.stuff, p2, false)
        // set stuff's image
        var stuffImage = stuffView.findViewById<ImageView>(R.id.imageView_stuff)
//        stuffImage.setImageDrawable(context.resources.getDrawable(stuffs[position].image))
        // Compress image and set to ImageView's bitmap
        val resources = context.resources
        // Get bitmap class on a new thread
        doAsync {
            val bitmap = BitmapCompress.compressBySize(resources, stuffs[position].image, 40, 40)
            context.runOnUiThread {
                // set stuff's imageView on UI thread
                stuffImage.setImageBitmap(bitmap)
            }
        }
        // set stuff's name
        var stuffName = stuffView.findViewById<TextView>(R.id.textView_stuff_name)
        stuffName.setText(stuffs[position].name)

        return stuffView
    }

    override fun getItem(position: Int): Any {
        return stuffs[position]
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getCount(): Int {
        return stuffs.size
    }

}