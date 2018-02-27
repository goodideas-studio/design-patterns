package com.androidcamp.goodideas.monsterhunter.PackageView

import android.content.Context
import android.content.res.Resources
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import com.androidcamp.goodideas.monsterhunter.PackageModel.Stuff
import com.androidcamp.goodideas.monsterhunter.R

/**
 * Created by York on 2018/2/26.
 */
class StuffAdapter(val context: Context, val stuffs: List<Stuff>): BaseAdapter() {
    override fun getView(position: Int, p1: View?, p2: ViewGroup?): View {
        var stuffView = LayoutInflater.from(context).inflate(R.layout.stuff, p2, false)
        // set stuff's image
        var stuffImage = stuffView.findViewById<ImageView>(R.id.imageView_stuff)
        stuffImage.setImageDrawable(context.resources.getDrawable(stuffs[position].image))
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