package com.androidcamp.goodideas.monsterhunter.presenter.shop

import android.content.DialogInterface
import android.support.v7.app.AlertDialog
import android.view.View
import android.widget.Toast
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.model.pack.Package
import com.androidcamp.goodideas.monsterhunter.model.pack.Stuff
import com.androidcamp.goodideas.monsterhunter.view.shop.ShopFragment
import com.techapp.james.gridviewdemo.ShopItem
import com.techapp.james.gridviewdemo.SingletonList
import kotlinx.android.synthetic.main.fragment_shop_.*
import kotlinx.android.synthetic.main.item_layout.view.*

/**
 * Created by James on 2018/2/28.
 */
class ShopPresenter {
    var shopFragment: ShopFragment? = null
    var removeIndex: Int = 0

    constructor(context: ShopFragment) {
        this.shopFragment = context
    }

    public fun positiveBtnClick() {
        var shopItem: ShopItem = SingletonList.get(removeIndex)
        if (Status.money >= shopItem.money!!) {
            Status.money -= shopItem.money!!
            SingletonList.removeAt(removeIndex)
            shopFragment!!.gridView.invalidateViews()
            Package.add(Stuff(shopItem.name!!, shopItem.image!!, shopItem.hp!!, shopItem.mp!!))
            shopFragment!!.textView_money.text = Status.money.toString()
        } else if (Status.money < shopItem.money!!) {
            Toast.makeText(shopFragment!!.context, "You don't have enouth money", Toast.LENGTH_SHORT).show()
        }
        if (SingletonList.size == 0) {
            shopFragment!!.gridView.visibility = View.INVISIBLE
            shopFragment!!.soldOut.textSize = 50f
            shopFragment!!.soldOut.visibility = View.VISIBLE
        }
    }

    public fun gridItemClick(dialogClickListener: DialogInterface.OnClickListener, view: View?, index: Int?) {
        var simpleDialog = AlertDialog.Builder(shopFragment!!.context).setPositiveButton("Yes", dialogClickListener).setNegativeButton("No", dialogClickListener).create()
        simpleDialog.setTitle(view!!.textView.text)
        simpleDialog.setMessage("Do you want to buy")
        simpleDialog.show()
        removeIndex = index!!;
    }
}