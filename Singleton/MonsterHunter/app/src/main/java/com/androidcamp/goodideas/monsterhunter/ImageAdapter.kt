package com.androidcamp.goodideas.monsterhunter

import android.annotation.SuppressLint
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.GridLayout
import android.widget.GridView
import android.widget.ImageView

/**
 * Created by York on 2018/2/26.
 */
class ImageAdapter(val context: Context, val items: List<Stuff>): BaseAdapter() {
    override fun getView(position: Int, p1: View?, p2: ViewGroup?): View {
       var stuffView = LayoutInflater.from(context).inflate(R.layout.stuff, p2, false)

        return stuffView
    }

    override fun getItem(position: Int): Any {
        return items[position]
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getCount(): Int {
        return items.size
    }
}