package com.androidcamp.goodideas.monsterhunter

import android.app.AlertDialog
import android.app.Dialog
import android.app.DialogFragment
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import android.util.Log
import android.view.View

/**
 * Created by York on 2018/2/26.
 */
class UseStuffDialog(): android.support.v4.app.DialogFragment() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val builder = AlertDialog.Builder(context)
        builder.setTitle("使用")
                .setMessage("確定要使用此道具?")
                .setPositiveButton("確定",DialogInterface.OnClickListener { dialogInterface, i ->
                    Log.d("UseStuffDialog", "確認")
                }).setNegativeButton("取消", DialogInterface.OnClickListener {dialogInterface, i ->  })
        val dialog = builder.create()
    }


}