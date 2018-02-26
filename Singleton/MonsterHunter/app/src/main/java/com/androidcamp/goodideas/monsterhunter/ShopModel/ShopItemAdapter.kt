package com.techapp.james.gridviewdemo

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import com.androidcamp.goodideas.monsterhunter.R
import kotlinx.android.synthetic.main.item_layout.view.*

/**
 * Created by James on 2018/2/26.
 */
class ShopItemAdapter : BaseAdapter {
    private var itemList = ArrayList<ShopItem>()
    private var context: Context? = null

    constructor(context: Context, itemList: ArrayList<ShopItem>) : super() {
        this.context = context
        this.itemList = itemList
    }

    override fun getView(position: Int, contextView: View?, viewGroup: ViewGroup?): View {
        val shopItem = this.itemList[position]
        var inflator = context!!.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        var shopView = inflator.inflate(R.layout.item_layout, null)
        shopView.itemImageView.setImageResource(shopItem.image!!)
        shopView.textView.setText(shopItem.name)
        return shopView
    }

    override fun getItem(p0: Int): Any {
        return itemList[p0]
    }

    override fun getItemId(p0: Int): Long {
        return p0.toLong()
    }

    override fun getCount(): Int {
        return itemList.size
    }
}