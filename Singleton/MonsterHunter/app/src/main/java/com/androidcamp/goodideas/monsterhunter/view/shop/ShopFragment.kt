package com.androidcamp.goodideas.monsterhunter.view.shop

import android.content.DialogInterface
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.app.AlertDialog
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.Toast
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.R
import com.androidcamp.goodideas.monsterhunter.model.pack.Package
import com.androidcamp.goodideas.monsterhunter.model.pack.Stuff
import com.androidcamp.goodideas.monsterhunter.presenter.shop.ShopPresenter
import com.techapp.james.gridviewdemo.ShopItem
import com.techapp.james.gridviewdemo.ShopItemAdapter
import com.techapp.james.gridviewdemo.SingletonList
import kotlinx.android.synthetic.main.fragment_shop_.*
import kotlinx.android.synthetic.main.item_layout.view.*

class ShopFragment : Fragment() {
    var adapter: ShopItemAdapter? = null
    var shopPresenter: ShopPresenter? = null
    var dialogClickListener: DialogInterface.OnClickListener = DialogInterface.OnClickListener { dialog, which ->
        when (which) {
            DialogInterface.BUTTON_POSITIVE -> {
                shopPresenter!!.positiveBtnClick()
            }
            DialogInterface.BUTTON_NEGATIVE -> {
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        shopPresenter = ShopPresenter(this)
    }

    override fun onStart() {
        adapter = ShopItemAdapter(this.context, SingletonList)
        gridView.adapter = adapter
        gridView.setOnItemClickListener(object : AdapterView.OnItemClickListener {
            override fun onItemClick(adapterView: AdapterView<*>?, view: View?, p2: Int, p3: Long) {
                shopPresenter!!.gridItemClick(dialogClickListener, view, p2)
            }
        })
        textView_money.text = Status.money.toString()
        super.onStart()
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        return inflater!!.inflate(R.layout.fragment_shop_, container, false)
    }
}
