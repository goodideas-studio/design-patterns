package com.androidcamp.goodideas.monsterhunter

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
import com.androidcamp.goodideas.monsterhunter.model.pack.Package
import com.androidcamp.goodideas.monsterhunter.model.pack.Stuff
import com.techapp.james.gridviewdemo.ShopItem
import com.techapp.james.gridviewdemo.ShopItemAdapter
import com.techapp.james.gridviewdemo.SingletonList
import kotlinx.android.synthetic.main.fragment_shop_.*
import kotlinx.android.synthetic.main.item_layout.view.*

class ShopFragment : Fragment() {
    var adapter: ShopItemAdapter? = null
    var removeIndex: Int = 0
    var dialogClickListener: DialogInterface.OnClickListener = DialogInterface.OnClickListener { dialog, which ->
        when (which) {
            DialogInterface.BUTTON_POSITIVE -> {
                var shopItem:ShopItem=SingletonList.get(removeIndex)
                if(Status.money>=shopItem.money!!) {
                 Status.money-=shopItem.money!!
                    SingletonList.removeAt(removeIndex)
                    gridView.invalidateViews()
                    Package.add(Stuff(shopItem.name!!, shopItem.image!!, shopItem.hp!!, shopItem.mp!!))
                    textView_money.text=Status.money.toString()
                }else if(Status.money<shopItem.money!!){
                    Toast.makeText(this@ShopFragment.context,"You don't have enouth money",Toast.LENGTH_SHORT).show()
                }
                if (SingletonList.size == 0) {
                    gridView.visibility=View.INVISIBLE
                    soldOut.textSize=50f
                    soldOut.visibility=View.VISIBLE
                }
            }
            DialogInterface.BUTTON_NEGATIVE -> {
            }
        }
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    override fun onStart() {
        adapter = ShopItemAdapter(this.context, SingletonList)

        gridView.adapter = adapter
        gridView.setOnItemClickListener(object : AdapterView.OnItemClickListener {
            override fun onItemClick(adapterView: AdapterView<*>?, view: View?, p2: Int, p3: Long) {
                var simpleDialog = AlertDialog.Builder(this@ShopFragment.context).setPositiveButton("Yes", dialogClickListener).setNegativeButton("No", dialogClickListener).create()
                simpleDialog.setTitle(view!!.textView.text)
                simpleDialog.setMessage("Do you want to buy")
                simpleDialog.show()
                removeIndex = p2;
            }
        })
        textView_money.text=Status.money.toString()
        super.onStart()
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        return inflater!!.inflate(R.layout.fragment_shop_, container, false)
    }




}
