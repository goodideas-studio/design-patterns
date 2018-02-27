package com.androidcamp.goodideas.monsterhunter.PackageView

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.androidcamp.goodideas.monsterhunter.R

class PackActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pack)

    }

//    fun changeTotalCount() {
//        textView_pack_amount.setText(Package.size.toString())
//    }
//
//    fun initGridView() {
//        val adapter = StuffAdapter(this, Package)
//        gridView_pack_stuffList.adapter = adapter
//
//        gridView_pack_stuffList.onItemClickListener = AdapterView.OnItemClickListener { adapterView, view, index, long ->
//            Log.d("PackActivity", "clicked")
//            val builder = android.app.AlertDialog.Builder(this)
//            builder.setTitle("使用")
//                    .setMessage("確定要使用此道具?")
//                    .setPositiveButton("確定", DialogInterface.OnClickListener { dialogInterface, i ->
//                        Log.d("UseStuffDialog", "確認")
//                        Package.removeAt(index)
//                        adapter.notifyDataSetChanged()
//                        changeTotalCount()
//                    }).setNegativeButton("取消", DialogInterface.OnClickListener { dialogInterface, i ->  })
//                    .show()
//
//        }
//    }
}
